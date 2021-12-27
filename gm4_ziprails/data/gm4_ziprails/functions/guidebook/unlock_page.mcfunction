# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:ziprails/page_<number>

tellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[Ziprails]","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"Ziprails","color":"#4AA0C7"},{"text":"\n"},{"text":"Automatically latch on to a tripwire to sail through the sky on a suspended line!","italic":true,"color":"gray"}]}}]
