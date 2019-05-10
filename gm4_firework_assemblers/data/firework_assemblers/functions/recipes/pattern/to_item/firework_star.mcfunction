#@s = firework assemblers with pattern to item recipe

#modify item data
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Explosion set from block ~ ~ ~ Items[{Slot:1b}].tag.Fireworks.Explosions[0]

#effects
function firework_assemblers:recipes/effects
