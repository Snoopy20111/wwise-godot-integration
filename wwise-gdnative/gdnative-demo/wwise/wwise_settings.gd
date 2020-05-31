tool
extends Node

const WWISE_COMMON_USER_SETTINGS_PATH = "wwise/common_user_settings/"
const WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH = "wwise/common_user_settings/main_output/"
const WWISE_COMMON_USER_SETTINGS_SPATIAL_AUDIO_PATH = "wwise/common_user_settings/spatial_audio/"
const WWISE_COMMON_ADVANCED_SETTINGS_PATH = "wwise/common_advanced_settings/"
const WWISE_COMMUNICATION_SETTINGS_PATH = "wwise/communication_settings/"
const WWISE_IOS_ADVANCED_SETTINGS_PATH = "wwise/ios_advanced_settings/"
const WWISE_WINDOWS_ADVANCED_SETTINGS_PATH = "wwise/windows_advanced_settings/"

func _init():
	_add_common_user_settings()
	_add_common_advanced_settings()
	_add_commnunication_settings()
	_add_ios_advanced_settings()
	_add_windows_advanced_settings()

	var error = ProjectSettings.save()
	
	if error: 
		push_error("Encountered error %d when saving project settings." % error)

func _add_common_user_settings():
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "base_path", String("res://Banks"), 
				TYPE_STRING, PROPERTY_HINT_DIR, "res://Banks")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "startup_language", String("English(US)"), TYPE_STRING, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "callback_manager_buffer_size", 4096, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "engine_logging", 0, TYPE_BOOL, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "maximum_number_of_positioning_paths", 255, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "command_queue_size", 262144, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "samples_per_frame", 2, TYPE_INT, 
				PROPERTY_HINT_ENUM, "256, 512, 1024, 2048")

	_add_setting(WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH + "audio_device_shareset", "", TYPE_STRING, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH + "device_id", 0, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH + "panning_rule", String("Speakers"), TYPE_STRING, 
				PROPERTY_HINT_ENUM, "Speakers, Headphones")
	_add_setting(WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH + "channel_config/channel_config_type",
				 String("Annonymous"), TYPE_STRING, PROPERTY_HINT_ENUM, "Annonymous, Standard, Ambisonics")
	_add_setting(WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH + "channel_config/channel_mask",
				 String("NONE"), TYPE_STRING, PROPERTY_HINT_ENUM, "NONE, Everything, SETUP_ALL_SPEAKERS")
	_add_setting(WWISE_COMMON_USER_SETTINGS_MAIN_OUTPUT_PATH + "channel_config/number_of_channels",
				 0, TYPE_INT, PROPERTY_HINT_NONE, "")

	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "streaming_look_ahead_ratio", 1, TYPE_REAL, 
				PROPERTY_HINT_RANGE, "0.0, 1.0")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "sample_rate", 4, TYPE_INT, 
				PROPERTY_HINT_ENUM, "16000, 24000, 32000, 44100, 48000")
	_add_setting(WWISE_COMMON_USER_SETTINGS_PATH + "number_of_refills_in_voice", 1, TYPE_INT, 
				PROPERTY_HINT_ENUM, "2, 4")
				
	_add_setting(WWISE_COMMON_USER_SETTINGS_SPATIAL_AUDIO_PATH + "TODO", 0, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
				
func _add_common_advanced_settings():
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "IO_memory_size", 2097152, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "target_auto_stream_buffer_length_ms", 
				380, TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "use_stream_cache", 
				0, TYPE_BOOL, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "maximum_pinned_bytes_in_cache", 
				4294967295, TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "enable_game_sync_preparation", 
				0, TYPE_BOOL, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "continuous_playback_look_ahead", 
				1, TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "monitor_queue_pool_size", 
				65536, TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "maximum_hardware_timeout_ms", 
				1000, TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "debug_out_of_range_check_enabled", 
				0, TYPE_BOOL, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "debug_out_of_range_limit", 
				0, TYPE_INT, PROPERTY_HINT_NONE, "")

	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "spatial_audio/TODO", 
				0, TYPE_INT, PROPERTY_HINT_NONE, "")

	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "render_during_focus_loss", 
				0, TYPE_BOOL, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "sound_bank_persistent_data_path", 
				"", TYPE_STRING, PROPERTY_HINT_DIR, "")
	_add_setting(WWISE_COMMON_ADVANCED_SETTINGS_PATH + "use_async_open", 
				0, TYPE_BOOL, PROPERTY_HINT_NONE, "")
	
func _add_commnunication_settings():
	_add_setting(WWISE_COMMUNICATION_SETTINGS_PATH + "pool_size", 262144, TYPE_INT, 
				PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMUNICATION_SETTINGS_PATH + "discovery_broadcast_port", 24024, 
				TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMUNICATION_SETTINGS_PATH + "command_port", 0, 
				TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMUNICATION_SETTINGS_PATH + "notification_port", 0, 
				TYPE_INT, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMUNICATION_SETTINGS_PATH + "initialize_system_comms", 1, 
				TYPE_BOOL, PROPERTY_HINT_NONE, "")
	_add_setting(WWISE_COMMUNICATION_SETTINGS_PATH + "network_name", "", 
				TYPE_STRING, PROPERTY_HINT_NONE, "")
	
func _add_ios_advanced_settings():
	_add_setting(WWISE_IOS_ADVANCED_SETTINGS_PATH + "audio_session_category", String("Ambient"),
				TYPE_STRING, PROPERTY_HINT_ENUM, "Ambient, Solo Ambient, Play And Record")
	_add_setting(WWISE_IOS_ADVANCED_SETTINGS_PATH + "audio_session_category_options", 52,
				TYPE_INT, PROPERTY_HINT_FLAGS, "Nothing, Everything, Mix with others, Duck others, Allow bluetooth, Default to speaker")
	_add_setting(WWISE_IOS_ADVANCED_SETTINGS_PATH + "audio_session_mode", 1,
				TYPE_INT, PROPERTY_HINT_FLAGS, "Default, Voice Chat, Game Chat, Video Recording, Measurement, Movie Playback, Video Chat")
	
func _add_windows_advanced_settings():
	_add_setting(WWISE_WINDOWS_ADVANCED_SETTINGS_PATH + "audio_API", 30,
				TYPE_INT, PROPERTY_HINT_FLAGS, "None, Default, Wasapi, X Audio 2, Direct Sound")
	_add_setting(WWISE_WINDOWS_ADVANCED_SETTINGS_PATH + "global_focus", 1,
				TYPE_BOOL, PROPERTY_HINT_NONE, "")

func _add_setting(name, defaultValue, type, hint, hintString):
	if ProjectSettings.has_setting(name): 
		return

	var settingInfo = {
		"name": name,
		"type": type,
		"hint": hint,
		"hint_string": hintString
	}

	ProjectSettings.set_setting(name, defaultValue)
	ProjectSettings.add_property_info(settingInfo)
	ProjectSettings.set_initial_value(name, defaultValue)