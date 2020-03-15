/*
    一个简单的 lua 解释器

    PS: 
    1. 先去官网 lua.org 下载源码包, 解压后, make linux && sudo make install 安装, 然后把 src 目录下的 liblua.a 拷贝一份过来用
    2. 编译选项: liblua.a -lm -ldl
    3. run interpreter and try: print("hello")
*/

#include <stdio.h>
#include <string.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

int main()
{
    char buff[256];
    int err;
    lua_State *L = luaL_newstate();             /* 创建一个新的lua状态 */
    luaL_openlibs(L);                           /* 打开标准库 */

    while (fgets(buff, sizeof(buff), stdin) != NULL) {
        err = luaL_loadstring(L, buff) ||       /* 编译用户输入的内容, 向栈中压入编译好的函数, 成功返回0, 出现错误, 向栈压入错误信息 */
              lua_pcall(L, 0, 0, 0);            /* 从栈中弹出函数, 并在保护模式下运行, 如果没有错误, 返回0, 出现错误, 向栈压入错误信息 */
        
        if (err) {
            fprintf(stderr, "%s\n", lua_tostring(L, -1)); /* 获取错误信息 */
            lua_pop(L, 1);                      /* 从栈中弹出错误信息 */
        }
    }

    lua_close(L);

    return 0;
}