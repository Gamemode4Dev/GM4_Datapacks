# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:crossbow_cartridges/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Crossbow Cartridges]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Crossbow Cartridges","color":"#4AA0C7"},{"text":"\n"},{"text":"Shoot more than just arrows!","italic":true,"color":"gray"}]}}]
