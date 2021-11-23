# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:zauber_liquids/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Zauber Liquids]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Zauber Liquids","color":"#4AA0C7"},{"text":"\n"},{"text":"From cauldron-made potions to potion-filled tanks! Store your tier IV potions and wormholes in Liquid Tanks!","italic":true,"color":"gray"}]}}]
