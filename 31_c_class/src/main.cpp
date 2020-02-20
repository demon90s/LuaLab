#include "lua.hpp"

int main()
{
    const char *lua_file = "../src/main.lua";

    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    if (luaL_dofile(L, lua_file) != LUA_OK)
    {
        fprintf(stderr, "[LUA-ERROR]: %s\n", lua_tostring(L, -1));
    }

    lua_close(L);
}