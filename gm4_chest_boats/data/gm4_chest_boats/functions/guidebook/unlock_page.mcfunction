# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_chest_boats:guidebook/page_<number>

tellraw @a ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Chest Boats]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Chest Boats","color":"#4AA0C7"},{"text":"\n"},{"text":"A chest inside of a boat!","italic":true,"color":"gray"}]}}]
