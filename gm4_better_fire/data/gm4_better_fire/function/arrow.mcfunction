# Sets one fire block
# Attempts to spawn a flint
# Destroys arrow, once it has made contact with a block
# @s = arrow
# runs from on_fire

setblock ~ ~ ~ fire keep
execute if entity @s[nbt={pickup:1b}] run loot spawn ~ ~ ~ loot gm4_better_fire:entities/flame_arrow/flint

kill @s
