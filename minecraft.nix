{...}: {
  name = "minecraft";
  lock.file = ./minecraft.lock;
  minecraft = {
    game.versionRegex = ''^1\.21(\.\d+)?$'';
    modDefaults = {
      primaryFileOnly = true;
      # always accept beta
      versionTypeRegex = "release|beta";
    };
    mods = [
      # libraries
      "https://modrinth.com/mod/fabric-api"
      "https://modrinth.com/mod/badpackets"
      "https://modrinth.com/mod/fabric-language-kotlin"
      "https://modrinth.com/mod/cloth-config"
      "https://modrinth.com/mod/architectury-api"
      "https://modrinth.com/mod/libipn"
      "https://modrinth.com/mod/silk"

      # client-side optimization
      "https://modrinth.com/mod/sodium"
      "https://modrinth.com/mod/sodium-extra"
      "https://modrinth.com/mod/indium"
      "https://modrinth.com/mod/entityculling"
      "https://modrinth.com/mod/immediatelyfast"

      # client tools
      "https://modrinth.com/mod/iris"
      "https://modrinth.com/mod/rei"
      "https://modrinth.com/mod/mouse-tweaks"
      "https://modrinth.com/mod/inventory-profiles-next"

      # client gui
      "https://modrinth.com/mod/modmenu"
      "https://modrinth.com/mod/reeses-sodium-options"
      "https://modrinth.com/mod/xaeros-minimap"
      "https://modrinth.com/mod/xaeros-world-map"
      "https://modrinth.com/mod/dynamiccrosshair"

      # server-side optimization
      "https://modrinth.com/mod/lithium"

      # client&server-side optimization
      "https://modrinth.com/mod/ferrite-core"

      # server plugin
      "https://modrinth.com/mod/luckperms"
      "https://modrinth.com/mod/essential-commands"
      "https://modrinth.com/plugin/chunky"
      "https://modrinth.com/plugin/worldedit"
      "https://modrinth.com/mod/clumps"
      "https://modrinth.com/plugin/dynmap"
      "https://modrinth.com/mod/fallingtree"
      "https://modrinth.com/mod/veinminer"

      # client&server addons
      "https://modrinth.com/mod/wthit"
      "https://modrinth.com/mod/appleskin"
      "https://modrinth.com/plugin/simple-voice-chat"

      # not supported yet
      # "https://modrinth.com/plugin/unifiedmetrics"
    ];
  };
}
