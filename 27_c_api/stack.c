/*
    Lua 和 C 之间通信的主要组件是 stack. 几乎所有的 API 调用都是操作 stack 中的值.
*/

/*
    压入元素的 API

    void lua_pushnil(lua_State *L);
    void lua_pushboolean(lua_State *L, int bool);
    void lua_pushnumber(lua_State *L, lua_Number n);        // 默认压入 double
    void lua_pushinteger(lua_State *L, lua_Integer n);      // 默认压入 long long
    void lua_pushlstring(lua_State *L, const char *s, size_t len);
    void lua_pushstring(lua_State *L, const char *s);       // 压入以'\0'结尾的字符串
*/

/*
    查询元素的 API

    int lua_toboolean(lua_State *L, int index);             // 类型不匹配返回0
    const char* lua_tolstring(lua_State *L, int index, size_t *len);    // 类型不匹配返回 NULL, 返回的字符串一定以 '\0' 结尾, 但中间也可能有 '\0' , len 表示字符串的真实长度
    const char* lua_tostring(lua_State *L, int index);      // 类型不匹配返回 NULL
    lua_State* lua_tothread(lua_State *L, int index);       // 类型不匹配返回 NULL
    lua_Number lua_tonumber(lua_State *L, int index);       // 类型不匹配返回 0
    lua_Integer lua_tonumber(lua_State *L, int index);      // 类型不匹配返回 0

    int lua_type(lua_State *L, int index);                  // 返回第 index 个元素的类型标识
    const char* lua_typename(lua_State *L, int type);       // 根据类型标识给出类型的名字

    int lua_isinteger(lua_State *L, int index);             // 返回第 index 个元素是否是整型
*/

/*
    其他栈 API

    int lua_gettop(lua_State *L);                           // 返回栈中元素的个数
    void lua_settop(lua_State *L, int index);               // 修改栈元素的数量, 若变大了, 用 nil 压入以补足. 否则丢掉多余的. lua_settop(L, 0) 清空栈, lua_settop(L, -(n) - 1) 弹出 n 个元素
    void lua_pushvalue(lua_State *L, int index);            // 将 index 上的副本压入栈
    void lua_rotate(lua_State *L, int index, int n);        // 将 index 上的元素往栈顶转动n个位置
    void lua_remove(lua_State *L, int index);               // 删掉 index 上的元素, 上面的元素往下移动以填补
    void lua_insert(lua_State *L, int index);               // 将栈顶元素移动至 index 上, 并上移之上的所有元素
    void lua_replace(lua_State *L, int index);              // 弹出一个值, 并将栈顶设置为 index 上的值
    void lua_copy(lua_State *L, int fromidx, int toidx);    // 将 fromidx 上的值复制到 toidx 上
*/

#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static void stackDump(lua_State *L)
{
    int i;
    int top = lua_gettop(L);            /* 栈的深度 */

    for (i = 1; i <= top; i++) {
        int t = lua_type(L, i);
        switch (t)
        {
            case LUA_TSTRING:
            {
                printf("'%s'", lua_tostring(L, i));
            }
            break;

            case LUA_TBOOLEAN:
            {
                printf(lua_toboolean(L, i) ? "true" : "false");
            }
            break;

            case LUA_TNUMBER:
            {
                printf("%g", lua_tonumber(L, i));
            }
            break;
        
            default:
            {
                printf("%s", lua_typename(L, t));
            }
            break;
        }

        printf(" ");
    }
    printf("\n");
}

int main()
{
    lua_State *L = luaL_newstate();

    lua_pushboolean(L, 1);
    lua_pushnumber(L, 10);
    lua_pushnil(L);
    lua_pushstring(L, "hello");

    stackDump(L);                   // true 10 nil hello

    lua_pushvalue(L, -4);           // 把倒数第4个元素的副本压栈
    stackDump(L);                   // true 10 nil hello true

    lua_replace(L, 3);              // 弹出栈顶元素, 把这个元素的副本设置给第3个元素
    stackDump(L);                   // true 10 true hello

    lua_settop(L, 6);               // 把栈的元素设置成6个, 补俩 nil
    stackDump(L);                   // true 10 true hello nil nil

    lua_rotate(L, 3, 1);            // 把第3个元素向栈顶转1个位置
    stackDump(L);                   // true 10 nil true hello nil

    lua_remove(L, -3);              // 把倒数第3个元素删掉
    stackDump(L);                   // true 10 nil hello nil

    lua_settop(L, -5);              // 从栈顶删掉4个元素
    stackDump(L);                   // true

    lua_close(L);
    return 0;
}