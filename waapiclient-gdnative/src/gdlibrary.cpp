#include "waapiclient_gdnative.h"

extern "C" void GDN_EXPORT waapi_gdnative_init(godot_gdnative_init_options* o)
{
	godot::Godot::gdnative_init(o);
}

extern "C" void GDN_EXPORT waapi_gdnative_terminate(godot_gdnative_terminate_options* o)
{
	godot::Godot::gdnative_terminate(o);
}

extern "C" void GDN_EXPORT waapi_nativescript_init(void* handle)
{
	godot::Godot::nativescript_init(handle);
	godot::register_class<godot::Waapi>();
	godot::register_tool_class<godot::Waapi>();
}