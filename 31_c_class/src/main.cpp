#include "lua.hpp"
#include <iostream>

int main(int argc, char *argv[])
{
    const char *lua_file = "../src/main.lua";

    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    if (luaL_dofile(L, lua_file) != LUA_OK)
    {
        fprintf(stderr, "[LUA-ERROR]: %s\n", lua_tostring(L, -1));
    }

    lua_close(L);

	std::cin.get();
}