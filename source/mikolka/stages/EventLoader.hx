package mikolka.stages;

import mikolka.compatibility.ModsHelper;
import mikolka.vslice.StickerSubState;
import mikolka.compatibility.VsliceOptions;
import mikolka.stages.standard.*;
import mikolka.stages.objects.*;
import mikolka.stages.scripts.*;
import mikolka.stages.erect.*;
import haxe.ds.List;
#if !LEGACY_PSYCH
#if LUA_ALLOWED
import psychlua.FunkinLua;
import mikolka.vslice.components.crash.UserErrorSubstate;
#end
#end

class EventLoader extends BaseStage {
    public static var currentStage:BaseStage = null;
    #if LUA_ALLOWED
    public static function implement(funk:FunkinLua)
        {
            var lua:State = funk.lua;
            funk.set('versionPS', MainMenuState.pSliceVersion.trim());
            Lua_helper.add_callback(lua, "changeTransStickers", function(stickerSet:String = null,stickerPack:String = null) {
                if(stickerSet != null && stickerSet != "") StickerSubState.STICKER_SET = stickerSet;
                if(stickerPack != null && stickerPack != "") StickerSubState.STICKER_PACK = stickerPack;
            });
            Lua_helper.add_callback(lua, "getFreeplayCharacter", function() {
                return VsliceOptions.LAST_MOD.char_name;
            });
            Lua_helper.add_callback(lua, "setFreeplayCharacter", function(character:String,modded:Bool = false) {
                VsliceOptions.LAST_MOD = {
                    mod_dir: modded? ModsHelper.getActiveMod() : "",
                    char_name: character
                }; //? save selected character
            });
        }
    #end
    public static function addstage(name:String) {
        currentStage = null;

        if(VsliceOptions.LEGACY_BAR) new LegacyScoreBars();
        new VSliceEvents();

        currentStage = switch (name)
		{
            default: null;
		};
    } 
}