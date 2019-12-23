/*
    从C语言中调用 lua 函数
*/

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

void error(lua_State *L, const char *fmt, ...)
{
    va_list argp;
    va_start(argp, fmt);
    vfprintf(stderr, fmt, argp);
    va_end(argp);
    lua_close(L);
    exit(EXIT_FAILURE);
}

/* 调用lua中定义的函数f */
double f(lua_State *L, double x, double y)
{
    int isnum;
    double z;

    /* 函数和参数压栈 */
    lua_getglobal(L, "f");      /* 要调用的函数 */
    lua_pushnumber(L, x);       /* 压入第一个参数 */
    lua_pushnumber(L, y);       /* 压入第二个参数 */

    /* 进行调用, 2个参数, 1个结果 */
    if (lua_pcall(L, 2, 1, 0) != LUA_OK)
        error(L, "error running function 'f': %s", lua_tostring(L, -1));

    /* 获取结果 */
    z = lua_tonumberx(L, -1, &isnum);
    if (!isnum)
        error(L, "function 'f' should return a number");

    lua_pop(L, 1);              /* 弹出返回值 */
    return z;
}

int main()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    if (luaL_loadfile(L, "config.lua") || lua_pcall(L, 0, 0, 0))
        error(L, "cannot run config file: %s", lua_tostring(L, -1));

    printf("%g\n", f(L, 3, 4));

    lua_close(L);

    return 0;
}