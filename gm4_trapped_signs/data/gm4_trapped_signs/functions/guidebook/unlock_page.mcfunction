# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:trapped_signs/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Trapped Signs]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Trapped Signs","color":"#4AA0C7"},{"text":"\n"},{"text":"Craft trapped signs which, when right-clicked, give off a redstone signal.","italic":true,"color":"gray"}]}}]
