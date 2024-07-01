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
      "https://modrinth.com/mod/fabric-api"
      "https://modrinth.com/mod/sodium"
      "https://modrinth.com/mod/reeses-sodium-options"
      "https://modrinth.com/mod/sodium-extra"
      "https://modrinth.com/mod/lithium"
      "https://modrinth.com/mod/indium"
      "https://modrinth.com/mod/iris"
      "https://modrinth.com/mod/entityculling"
      "https://modrinth.com/mod/ferrite-core"
      "https://modrinth.com/mod/modmenu"
      "https://modrinth.com/mod/luckperms"
      "https://modrinth.com/mod/essential-commands"
      "https://modrinth.com/mod/wthit"
      "https://modrinth.com/mod/badpackets"
      "https://modrinth.com/mod/fabric-language-kotlin"
      "https://modrinth.com/mod/rei"
      "https://modrinth.com/mod/cloth-config"
      "https://modrinth.com/mod/architectury-api"
      "https://modrinth.com/plugin/chunky"
      "https://modrinth.com/mod/xaeros-minimap"
      "https://modrinth.com/mod/xaeros-world-map"
      "https://modrinth.com/plugin/worldedit"
      "https://modrinth.com/mod/clumps"
      "https://modrinth.com/plugin/dynmap"
      # not supported yet
      # "https://modrinth.com/mod/lazydfu"
      # "https://modrinth.com/mod/mouse-wheelie"
      # "https://modrinth.com/plugin/unifiedmetrics"
    ];
  };
}
