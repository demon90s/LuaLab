#include "lua.hpp"

#ifdef _MSC_VER
    #ifdef MAKE_DLL
    #define DLLEXPORT_API __declspec( dllexport )
    #else
    #define DLLEXPORT_API __declspec( dllimport )
    #endif
#else
    #define DLLEXPORT_API
#endif

extern "C"
{
	DLLEXPORT_API int luaopen_libvector(lua_State *L);

	DLLEXPORT_API int vector_new(lua_State *L);

	DLLEXPORT_API int vector_free(lua_State *L);

	DLLEXPORT_API int vector_size(lua_State *L);
}
