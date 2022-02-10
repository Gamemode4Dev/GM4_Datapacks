# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:ender_hoppers/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Ender Hoppers]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Ender Hoppers","color":"#4AA0C7"},{"text":"\n"},{"text":"Create special hoppers that teleport nearby items to them.","italic":true,"color":"gray"}]}}]
