# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:better_armour_stands/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Better Armour Stands]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Better Armour Stands","color":"#4AA0C7"},{"text":"\n"},{"text":"This module gives you full control over the Armour Stand's pose, size, base plate, visibility, gravity, and more.. It's also expandable!","italic":true,"color":"gray"}]}}]
