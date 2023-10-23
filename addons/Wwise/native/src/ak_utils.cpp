#include "ak_utils.h"

using namespace godot;

AkUtils* AkUtils::singleton = nullptr;

void AkUtils::_bind_methods()
{
	BIND_ENUM_CONSTANT(AK_STATE_SHUTDOWN);
	BIND_ENUM_CONSTANT(AK_STATE_INITIALIZED);

	BIND_ENUM_CONSTANT(GAMEEVENT_NONE);
	BIND_ENUM_CONSTANT(GAMEEVENT_ENTER_TREE);
	BIND_ENUM_CONSTANT(GAMEEVENT_READY);
	BIND_ENUM_CONSTANT(GAMEEVENT_EXIT_TREE);

	BIND_ENUM_CONSTANT(AK_CURVE_LOG3);
	BIND_ENUM_CONSTANT(AK_CURVE_SINE);
	BIND_ENUM_CONSTANT(AK_CURVE_LOG1);
	BIND_ENUM_CONSTANT(AK_CURVE_INVSCURVE);
	BIND_ENUM_CONSTANT(AK_CURVE_LINEAR);
	BIND_ENUM_CONSTANT(AK_CURVE_SCURVE);
	BIND_ENUM_CONSTANT(AK_CURVE_EXP1);
	BIND_ENUM_CONSTANT(AK_CURVE_SINERECIP);
	BIND_ENUM_CONSTANT(AK_CURVE_EXP3);
	BIND_ENUM_CONSTANT(AK_CURVE_LASTFADECURVE);
	BIND_ENUM_CONSTANT(AK_CURVE_CONSTANT);

	BIND_ENUM_CONSTANT(AK_END_OF_EVENT);
	BIND_ENUM_CONSTANT(AK_END_OF_DYNAMIC_SEQUENCE_ITEM);
	BIND_ENUM_CONSTANT(AK_MARKER);
	BIND_ENUM_CONSTANT(AK_DURATION);
	BIND_ENUM_CONSTANT(AK_SPEAKER_VOLUME_MATRIX);
	BIND_ENUM_CONSTANT(AK_STARVATION);
	BIND_ENUM_CONSTANT(AK_MUSIC_PLAYLIST_SELECT);
	BIND_ENUM_CONSTANT(AK_MUSIC_PLAY_STARTED);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_BEAT);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_BAR);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_ENTRY);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_EXIT);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_GRID);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_USER_CUE);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_POINT);
	BIND_ENUM_CONSTANT(AK_MUSIC_SYNC_ALL);
	BIND_ENUM_CONSTANT(AK_MIDI_EVENT);
	BIND_ENUM_CONSTANT(AK_CALLBACK_BITS);
	BIND_ENUM_CONSTANT(AK_ENABLE_GET_SOURCE_PLAY_POSITION);
	BIND_ENUM_CONSTANT(AK_ENABLE_GET_MUSIC_PLAY_POSITION);
	BIND_ENUM_CONSTANT(AK_ENABLE_GET_SOURCE_STREAM_BUFFERING);

	BIND_ENUM_CONSTANT(TYPE_SINGLE_SOURCE);
	BIND_ENUM_CONSTANT(TYPE_MULTI_SOURCES);
	BIND_ENUM_CONSTANT(TYPE_MULTI_DIRECTIONS);

	BIND_ENUM_CONSTANT(AK_CODECID_BANK);
	BIND_ENUM_CONSTANT(AK_CODECID_PCM);
	BIND_ENUM_CONSTANT(AK_CODECID_ADPCM);
	BIND_ENUM_CONSTANT(AK_CODECID_XMA);
	BIND_ENUM_CONSTANT(AK_CODECID_VORBIS);
	BIND_ENUM_CONSTANT(AK_CODECID_WIIADPCM);
	BIND_ENUM_CONSTANT(AK_CODECID_PCMEX);
	BIND_ENUM_CONSTANT(AK_CODECID_EXTERNAL_SOURCE);
	BIND_ENUM_CONSTANT(AK_CODECID_XWMA);
	BIND_ENUM_CONSTANT(AK_CODECID_AAC);
	BIND_ENUM_CONSTANT(AK_CODECID_FILE_PACKAGE);
	BIND_ENUM_CONSTANT(AK_CODECID_ATRAC9);
	BIND_ENUM_CONSTANT(AK_CODECID_VAG);
	BIND_ENUM_CONSTANT(AK_CODECID_PROFILERCAPTURE);
	BIND_ENUM_CONSTANT(AK_CODECID_ANALYSISFILE);
	BIND_ENUM_CONSTANT(AK_CODECID_MIDI);
	BIND_ENUM_CONSTANT(AK_CODECID_OPUSNX);
	BIND_ENUM_CONSTANT(AK_CODECID_CAF);
	BIND_ENUM_CONSTANT(AK_CODECID_AKOPUS);
	BIND_ENUM_CONSTANT(AK_CODECID_AKOPUS_WEM);
	BIND_ENUM_CONSTANT(AK_CODECID_MEMORYMGR_DUMP);
	BIND_ENUM_CONSTANT(AK_CODECID_SONY360);
	BIND_ENUM_CONSTANT(AK_CODECID_BANK_EVENT);
	BIND_ENUM_CONSTANT(AK_CODECID_BANK_BUS);
}

AkUtils::AkUtils()
{
	ERR_FAIL_COND(singleton != nullptr);
	singleton = this;
}

AkUtils::~AkUtils()
{
	ERR_FAIL_COND(singleton != this);
	singleton = nullptr;
}

AkUtils* AkUtils::get_singleton() { return singleton; }