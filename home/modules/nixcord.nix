{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    config = {
      frameless = true;

      plugins = {
        fakeNitro.enable = true;
        alwaysTrust.enable = true;
        copyStickerLinks.enable = true;
        crashHandler.enable = true;
        disableDeepLinks.enable = true;
        expressionCloner.enable = true;
        fakeProfileThemes.enable = true;
        fixCodeblockGap.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        messageLogger = {
          enable = true;
          ignoreBots = false;
        };
        moreQuickReactions.enable = true;
        mutualGroupDms.enable = true;
        newGuildSettings = {
          enable = true;
          messages = 1;
        };
        noF1.enable = true;
        noMosaic.enable = true;
        noTrack.enable = true;
        pinDms = {
          enable = true;
          userBasedCategoryList = {
            "520940798578262036" = [
              {
                id = "mvlrwocc9y";
                name = "Most common";
                color = 10070709;
                collapsed = false;
                channels = [
                  "686962904058167408"
                  "768095830065283092"
                  "525649044492648449"
                ];
              }
            ];
          };
        };
        quickReply.enable = true;
        settings.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://cdn.jsdelivr.net/gh/shikijs/textmate-grammars-themes@bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/tokyo-night.json";
          useDevIcon = "COLOR";
        };
        supportHelper.enable = true;
        unlockedAvatarZoom.enable = true;
        usrbg.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        webContextMenus.enable = true;
        webKeybinds = {
          enable = true;
          overrideCommonKeybinds = true;
        };
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
      };
    };
  };
}
