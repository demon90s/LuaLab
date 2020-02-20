#include "cfunc.h"

#include "lua.h"
#include "lauxlib.h"

#include <sys/types.h>
#include <dirent.h>
#include <stdio.h>
#include <math.h>

// 注册成库,给lua require,库的名字就是 cfunc
static const struct luaL_Reg cfunc[] = {
    { "l_sin", l_sin },
    { "l_dir", l_dir },
    { NULL, NULL },
};

int luaopen_cfunc(lua_State *L) {
    luaL_newlib(L, cfunc); // 创建一个表
    return 1;   // 把表返回给Lua(解释器)
}

// 实现
int l_sin(lua_State *L)
{
    //double d = lua_tonumber(L, 1); // 获取参数
    double d = luaL_checknumber(L, 1); // 获取参数，并检查，如果不对，那么lua脚本将会报错
    lua_pushnumber(L, sin(d));  // 压入返回值
    return 1;   // 返回值个数
}

// return table example
int l_dir(lua_State *L)
{
    const char *path = luaL_checkstring(L, 1);  // 调用栈是独立的,所以栈顶就是函数参数

    DIR *dirp = opendir(path);
    if (dirp == NULL) {
        
        lua_pushnil(L);
        lua_pushstring(L, "opendir failed");

        return 2;  // 返回俩参数
    }

    int i = 1;
    lua_newtable(L);    // push empty table
    struct dirent *dirent_data;
    while ((dirent_data = readdir(dirp)) != NULL) {
        // push key
        lua_pushinteger(L, i++);

        // push value
        lua_pushstring(L, dirent_data->d_name);

        // insert key-value to table, pop key-value
        lua_settable(L, -3);
    }

    closedir(dirp);

    return 1;   // return one table
}