{ pkgs, lib, ... }:
{
  name = "minecraft";
  lock.file = ./minecraft.lock;
  minecraft = {
    game.versionRegex = ''^1\.21(\.\d+)?$'';
    modLoader = "fabric";
    shaderPackLoader = "iris";
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
      "https://modrinth.com/mod/gamma-utils"

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
      "https://modrinth.com/mod/servercore"
      "https://modrinth.com/mod/spark"
      "https://modrinth.com/mod/stackdeobf"

      # server plugin
      "https://modrinth.com/mod/luckperms"
      "https://modrinth.com/mod/essential-commands"
      "https://modrinth.com/plugin/chunky"
      "https://modrinth.com/plugin/worldedit"
      "https://modrinth.com/mod/clumps"
      "https://modrinth.com/plugin/dynmap"
      "https://modrinth.com/mod/fallingtree"
      "https://modrinth.com/mod/veinminer"
      "https://modrinth.com/mod/ledger"
      "https://modrinth.com/mod/easyauth"
      "https://modrinth.com/mod/easywhitelist"
      "https://modrinth.com/mod/fuji"
      "https://modrinth.com/mod/skinrestorer"
      "https://modrinth.com/mod/styledplayerlist"
      "https://www.curseforge.com/minecraft/mc-mods/carpet"

      # client&server addons
      "https://modrinth.com/mod/wthit"
      "https://modrinth.com/mod/appleskin"
      "https://modrinth.com/plugin/simple-voice-chat"
      "https://modrinth.com/mod/axiom"

      # not supported yet
      # "https://modrinth.com/plugin/unifiedmetrics"
    ];
    shaderPacks = [
      "https://modrinth.com/shader/bsl-shaders"
      "https://modrinth.com/shader/complementary-unbound"
      "https://modrinth.com/shader/complementary-reimagined"
    ];
    resourcePacks = [ "https://modrinth.com/resourcepack/fast-better-grass" ];
    files = {
      "server-icon.png" = {
        type = "server";
        source = ./assets/server-icon.png;
      };
    };
    launchScript = {
      inheritPath = true;
      path = with pkgs; [
        gnused
        yq-go
      ];
      preparation.modifySettings =
        let
          json = pkgs.formats.json { };
          fujiMixin = json.generate "fuji-mixin.json" {
            modules = {
              # keep-sorted start block=yes
              afk.enable = true;
              better_info.enable = true;
              chunks.enable = true;
              color.enable = true;
              command_permission.enable = true;
              config.enable = true;
              deathlog.enable = true;
              fake_player_manager.enable = true;
              language.enable = true;
              motd = {
                enable = true;
                enable_custom_server_icon = false;
                list = [
                  (lib.concatStringsSep "<newline>" [
                    "<gradient:#70aacf:#4fcc4d>Pure Survival %server:version% / Up %server:uptime%</gradient>"
                    "<gradient:#38cce5:#41b9ad>%fuji:server_playtime%🔥 %fuji:server_mined%⛏ %fuji:server_placed%🔳 %fuji:server_killed%🗡 %fuji:server_moved%🌍</gradient>"
                  ])
                ];
              };
              multi_obsidian_platform.enable = true;
              ping.enable = true;
              placeholder.enable = true;
              profiler.enable = true;
              pvp.enable = true;
              reply.enable = true;
              resource_world.enable = true;
              seen.enable = true;
              sit.enable = true;
              # keep-sorted end
            };
          };
          setProperty = property: value: "sed -i '/^${property}=/ s/=.*/=${value}/'";
          copyAsset =
            dir: file:
            let
              fullPath = "${dir}/${file}";
              asset = "${./assets/${fullPath}}";
            in
            ''
              mkdir --parents "${dir}"
              cp "${asset}" "${fullPath}"
              chmod u+w "${fullPath}"
            '';
        in
        {
          type = "server";
          text = ''
            # styled player list writes to this file
            ${copyAsset "config/styledplayerlist/styles" "default.json"}

            if [ -f config/fuji/config.json ]; then
              yq --inplace --prettyPrint '. *= load("${fujiMixin}")' config/fuji/config.json
            fi
            if [ -f config/EssentialCommands.properties ]; then
              ${setProperty "use_permissions_api" "true"} config/EssentialCommands.properties
              ${setProperty "home_limit" "1,5,10"} config/EssentialCommands.properties
            fi
          '';
          deps = [ "linkFiles" ];
        };
    };
  };
}
