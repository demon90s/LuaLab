#include "lua.hpp"

#include <vector>
#include <cstdlib>
#include <cstring>

#define VECTOR_METATABLE "libvectorint"

class VectorInt
{
public:
    VectorInt(size_t sz) : m_v(sz) {}

    std::vector<int> m_v;
};

// 创建userdata
// vector.new(sz)
static int vector_new(lua_State *L)
{
    luaL_checknumber(L, 1);
    
    int sz = static_cast<int>(lua_tonumber(L, 1));
    luaL_argcheck(L, sz >= 0, 1, "Invalid vector size");

    auto vec_int = static_cast<VectorInt*>(lua_newuserdata(L, sizeof(VectorInt)));
    memset(vec_int, 0, sizeof(*vec_int));

    *vec_int = VectorInt(sz);

    // 设置元表
    luaL_getmetatable(L, VECTOR_METATABLE);  // 元表压栈
    lua_setmetatable(L, -2);            // 为userdata设置元表,弹出元表

    return 1;   // 返回userdata
}

// 销毁掉
static int vector_free(lua_State *L)
{
    luaL_checktype(L, 1, LUA_TUSERDATA);

    auto vec_int = static_cast<VectorInt*>(luaL_checkudata(L, 1, VECTOR_METATABLE));

    vec_int->~VectorInt();
    // userdata内存不用释放,lua处理

    return 0;
}

// 获取长度
static int vector_size(lua_State *L)
{
    luaL_checktype(L, 1, LUA_TUSERDATA);

    auto vec_int = static_cast<VectorInt*>(luaL_checkudata(L, 1, VECTOR_METATABLE));

    lua_pushinteger(L, vec_int->m_v.size());
    
    return 1;
}

// 注册成库
extern "C" {
    static const struct luaL_Reg vector[] = {
        { "new", vector_new },
        { "free", vector_free },
        { "size", vector_size },
        { NULL, NULL },
    };

    int luaopen_libvector(lua_State *L) {

        // 注册一个元表,用来标识这个类型
        luaL_newmetatable(L, VECTOR_METATABLE);

        luaL_newlib(L, vector); // 创建一个表
        return 1;   // 把表返回给Lua(解释器)
    }
}
