#firework assembler recipe
#@s - firework assembler with valid recipe
#called by firework_assemblers:recipe_check

#store item data
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions set value [{}]
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions[0] set from block ~ ~ ~ Items[{Slot:1b}].tag.Explosion

#effects
function firework_assemblers:recipes/effects
