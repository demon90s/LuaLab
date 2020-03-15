#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#include <string.h>
#include <ctype.h>

const char lua_file[] = "../src/main.lua";

// 该函数对数组中的每一个值调用一个函数,然后将返回的结果写回给这个数组元素
int l_map(lua_State *L)
{
    // 第一个参数是一个表(数组)
    luaL_checktype(L, 1, LUA_TTABLE);

    // 第二个参数是一个函数
    luaL_checktype(L, 2, LUA_TFUNCTION);

    // 获取数组大小
    int n = luaL_len(L, 1);

    // lua数组下标从1开始
    for (int i = 1; i <= n; i++)
    {
        // 调用函数

        // 压入函数
        lua_pushvalue(L, 2);

        // 压入参数
        lua_geti(L, 1, i);

        // 调用,1参数,1返回值 
        // 传递错误,在一个函数中写是不错的,但主函数中应该用pcall,从而捕获所有的错误
        lua_call(L, 1, 1);

        // 写回
        lua_seti(L, 1, i);
    }

    return 0;   // 没有返回值
}

// 分割字符串
// str_split("hello:world:ni:hao", ":") -> { "hello", "world", "ni", "hao" }
int l_str_split(lua_State *L)
{
    luaL_checkstring(L, 1);     // 第一个参数是字符串
    luaL_checkstring(L, 1);     // 第二个参数是分割符

    // 拿到字符串进行操作
    const char *s = lua_tostring(L, 1);
    const char *delim = lua_tostring(L, 2);

    lua_newtable(L);    // 压入表
    int i = 1; // 插入的数组下标

    while ((delim = strchr(s, delim[0])) != NULL)
    {
        // 压入子串
        lua_pushlstring(L, s, delim - s);

        // 插入表
        lua_rawseti(L, -2, i);
        i++;

        s = delim + 1;
    }

    // 插入最后一个子串
    lua_pushstring(L, s);
    lua_rawseti(L, -2, i);

    return 1;   // 返回表
}

// 连接字符串
int l_str_concat(lua_State *L)
{
    // 获取深度,即参数个数
    int n = lua_gettop(L);

    // 连接成字符串
    lua_concat(L, n);

    return 1; // 返回连接后的结果
}

// 两个字符串连接,用 pushfstring
int l_str_concat2(lua_State *L)
{
    luaL_checkstring(L, 1);
    luaL_checkstring(L, 2);

    const char *s1 = lua_tostring(L, 1);
    const char *s2 = lua_tostring(L, 2);

    // 压入新的字符串
    lua_pushfstring(L, "[%s%s]", s1, s2);

    return 1;   // 返回新字符串
}

// 将字符串变成大写(使用缓冲区)
int l_str_toupper(lua_State *L)
{
    size_t len;
    luaL_checklstring(L, 1, &len);

    const char *s = lua_tostring(L, 1);

    // 分配缓冲区
    luaL_Buffer buff;
    char *p = luaL_buffinitsize(L, &buff, len);

    // 设置缓冲区
    for (int i = 0; i < len; i++)
    {
        p[i] = toupper(s[i]);
    }

    // 把缓冲区转成字符串,压栈
    luaL_pushresultsize(&buff, len);

    return 1;   // 返回转换到的字符串
}

// table.concat
int l_t_concat(lua_State *L)
{
    // 第一个参数是table
    luaL_checktype(L, 1, LUA_TTABLE);

    // 第二个参数是一个delim
    luaL_checkstring(L, 2);

    const char *delim = lua_tostring(L, 2);

    // 创建一个缓冲区
    luaL_Buffer buffer;
    luaL_buffinit(L, &buffer);

    // 获取数组的长度
    int n = luaL_len(L, 1);
    
    // 制作缓冲区
    for (int i = 1; i <= n; i++)
    {
        // 把数组元素压栈
        lua_geti(L, 1, i);

        // 追加元素到缓冲区(从栈顶拿)
        luaL_addvalue(&buffer);

        // 追加delim
        if (i < n)
            luaL_addstring(&buffer, delim);
    }

    // 转换缓冲区/压栈
    luaL_pushresult(&buffer);
    
    return 1;
}

int main()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    // bind
    lua_pushcfunction(L, l_map);
    lua_setglobal(L, "l_map");

    lua_pushcfunction(L, l_str_split);
    lua_setglobal(L, "l_str_split");

    lua_pushcfunction(L, l_str_concat);
    lua_setglobal(L, "l_str_concat");

    lua_pushcfunction(L, l_str_concat2);
    lua_setglobal(L, "l_str_concat2");

    lua_pushcfunction(L, l_str_toupper);
    lua_setglobal(L, "l_str_toupper");

    lua_pushcfunction(L, l_t_concat);
    lua_setglobal(L, "l_t_concat");

    int ret = luaL_dofile(L, lua_file);
    if (ret != LUA_OK)
    {
        const char *error = lua_tostring(L, -1);
        fprintf(stderr, "[LUA-ERROR]:\n%s\n", error);
    }

    lua_close(L);
}