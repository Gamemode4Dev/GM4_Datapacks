#@s = firework assemblers with firework rocket recipe and passed checks

#craft firework rocket(s)
data modify block ~ ~ ~ Items[{Slot:0b}].id set value "minecraft:firework_rocket"
data modify block ~ ~ ~ Items[{Slot:0b}].tag set value {Fireworks:{Flight:1b}}

replaceitem block ~ ~ ~ container.1 minecraft:air

#effects
function firework_assemblers:recipes/effects
