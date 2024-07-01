{...}: {
  name = "minecraft";
  lock.file = ./minecraft.lock;
  minecraft = {
    game.versionRegex = ''^1\.20(\.\d+)?$'';
    mods = [
      "https://modrinth.com/mod/fabric-api"
      "https://modrinth.com/mod/sodium"
      {
        url = "https://modrinth.com/mod/reeses-sodium-options";
        primaryFileOnly = true;
      }
      {
        url = "https://modrinth.com/mod/sodium-extra";
        primaryFileOnly = true;
      }
      "https://modrinth.com/mod/lithium"
      "https://modrinth.com/mod/indium"
      "https://modrinth.com/mod/iris"
      "https://modrinth.com/mod/starlight"
      "https://modrinth.com/mod/entityculling"
      "https://modrinth.com/mod/lazydfu"
      "https://modrinth.com/mod/ferrite-core"
      "https://modrinth.com/mod/modmenu"
      "https://modrinth.com/mod/luckperms"
      "https://modrinth.com/mod/essential-commands"
      "https://modrinth.com/mod/wthit"
      "https://modrinth.com/mod/badpackets"
      "https://modrinth.com/mod/mouse-wheelie"
      "https://modrinth.com/mod/fabric-language-kotlin"
      "https://modrinth.com/mod/rei"
      "https://modrinth.com/mod/cloth-config"
      "https://modrinth.com/mod/architectury-api"
      "https://modrinth.com/plugin/chunky"
      # "https://modrinth.com/plugin/unifiedmetrics" # not supported yet
      "https://modrinth.com/mod/xaeros-minimap"
      "https://modrinth.com/mod/xaeros-world-map"
      "https://modrinth.com/plugin/worldedit"
      "https://modrinth.com/mod/clumps"
      {
        url = "https://modrinth.com/plugin/dynmap";
        versionTypeRegex = "release|beta";
      }
    ];
  };
}
