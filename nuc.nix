{...}: {
  name = "nuc";
  launchers.lockFile = ./nuc.lock;
  mcConfig = {
    game.version = "1.19.4";
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
      # "https://modrinth.com/mod/lazydfu" # not support 1.19.4 yet
      "https://modrinth.com/mod/ferrite-core"
      "https://modrinth.com/mod/modmenu"
      "https://modrinth.com/mod/luckperms"
      "https://modrinth.com/mod/essential-commands"
      "https://modrinth.com/mod/wthit"
      "https://modrinth.com/mod/badpackets"
      "https://modrinth.com/mod/inventory-sorting"
      "https://modrinth.com/mod/fabric-language-kotlin"
      "https://modrinth.com/mod/healthcare"
      "https://modrinth.com/mod/rei"
      "https://modrinth.com/mod/cloth-config"
      "https://modrinth.com/mod/architectury-api"
      "https://modrinth.com/plugin/chunky"
      {
        name = "UnifiedMetrics";
        modrinthId = "p1ewR5kV";
        fakeGameVersion = "1.19.2";
        versionTypeRegex = "release|beta";
      }
      {
        url = "https://www.curseforge.com/minecraft/mc-mods/dynmapforge";
        versionTypeRegex = "release|beta";
      }
      {
        url = "https://www.curseforge.com/minecraft/mc-mods/xaeros-minimap";
        versionTypeRegex = "release|beta";
      }
      {
        url = "https://www.curseforge.com/minecraft/mc-mods/xaeros-world-map";
        versionTypeRegex = "release|beta";
      }
      "https://www.curseforge.com/minecraft/mc-mods/worldedit"
      "https://www.curseforge.com/minecraft/mc-mods/clumps"
    ];
  };
}
