# breaks the ladder because it is floating
# @s = ladder item that was broken by player
# at location of a ladder
# run from gm4_rope_ladders:mechanics/break_floating_ladders/scan_column/loop

# set scoreboard
scoreboard players add $ladder_broken gm4_rol_data 1

# audio
playsound minecraft:block.scaffolding.fall ambient @a[distance=..15] ~ ~ ~ 1 .5

# break ladder and drop item
setblock ~ ~ ~ air
loot spawn ~ ~ ~ loot minecraft:blocks/ladder
