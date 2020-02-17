#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include "math.h"

const char lua_file[] = "main.lua";

static int l_sin(lua_State *L)
{
    //double d = lua_tonumber(L, 1); // 获取参数
    double d = luaL_checknumber(L, 1); // 获取参数，并检查，如果不对，那么lua脚本将会报错
    lua_pushnumber(L, sin(d));  // 压入返回值
    return 1;   // 返回值个数
}

int main()
{
    lua_State *L = luaL_newstate();

    luaL_openlibs(L);

    lua_pushcfunction(L, l_sin);
    lua_setglobal(L, "l_sin");

    if (LUA_OK != luaL_dofile(L, lua_file))
    {
        const char *err = lua_tostring(L, -1);
        fprintf(stderr, "[LUA-ERROR]:\n%s\n", err);
    }

    lua_close(L);
}
