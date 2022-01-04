# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:xp_storage/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[XP Storage]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"XP Storage","color":"#4AA0C7"},{"text":"\n"},{"text":"Stand on top of an Ender Chest to store XP, stand below to retrieve it!","italic":true,"color":"gray"}]}}]
