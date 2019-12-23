/*
    使用C语言 API 加载　config.lua 的例子
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

int getglobalint(lua_State *L, const char *var)
{
    int isnum, result;
    lua_getglobal(L, var);          /* 将全局变量var的值压栈 */
    result = (int)lua_tointegerx(L, -1, &isnum);
    if (!isnum)
        error(L, "'%s' should be a number\n", var);

    lua_pop(L, 1);                  /* 从栈中移除结果 */
    return result;
}

void load(lua_State *L, const char *fname, int *w, int *h)
{
    if (luaL_loadfile(L, fname) || lua_pcall(L, 0, 0, 0))
        error(L, "cannot run config file: %s", lua_tostring(L, -1));

    *w = getglobalint(L, "width");
    *h = getglobalint(L, "height");
}

int main()
{
    int h = 0, w = 0;

    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    load(L, "config.lua", &h, &w);

    printf("height: %d\n", h);
    printf("weight: %d\n", w);

    lua_close(L);

    return 0;
}