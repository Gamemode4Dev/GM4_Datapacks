#firework assembler recipe
#@s - firework assembler with valid recipe
#called by firework_assemblers:recipe_check

#store item data
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions set value [{}]
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions[0] set from block ~ ~ ~ Items[{Slot:1b}].tag.Explosion
#set name
data modify block ~ ~ ~ Items[{Slot:0b}].tag.display.Name set value '{"translate":"%1$s","with":["Firework Pattern",{"translate":"item.gm4.firework_pattern"}],"italic":false,"color":"light_purple"}'
data modify block ~ ~ ~ Items[{Slot:0b}].tag.gm4_firework_assemblers.firework_pattern set value 1b

#lore
function firework_assemblers:recipes/pattern/add_lore

#effects
function firework_assemblers:recipes/effects
