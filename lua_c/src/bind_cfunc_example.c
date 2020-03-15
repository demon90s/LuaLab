#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#include "cfunc.h"

const char lua_file[] = "../src/main.lua";

int main()
{
    lua_State *L = luaL_newstate();

    luaL_openlibs(L);

    // bind functions
    lua_pushcfunction(L, l_sin);
    lua_setglobal(L, "l_sin");

    lua_pushcfunction(L, l_dir);
    lua_setglobal(L, "l_dir");

    // execute lua script
    if (LUA_OK != luaL_dofile(L, lua_file))
    {
        const char *err = lua_tostring(L, -1);
        fprintf(stderr, "[LUA-ERROR]:\n%s\n", err);
    }

    lua_close(L);
}
