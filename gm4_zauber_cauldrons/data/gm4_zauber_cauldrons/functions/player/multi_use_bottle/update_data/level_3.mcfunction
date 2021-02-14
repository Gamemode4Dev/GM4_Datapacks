# @s = player that consumed any multi_use_bottle 1 tick ago
# at @s
# run from player/multi_use_bottle/modify_bottle

# update lore
data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.display.Lore[0] set value '[{"text":"3/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]'
