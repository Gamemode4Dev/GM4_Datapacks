# updates nearby the air around ladder so that it breaks
# @s = freshly dropped ladder item
# positon of ladder
# run from function gm4_rope_ladders:update_ladders/scan_column/init

# set scoreboard
scoreboard players add $ladder_broken gm4_rol_data 1

# audio
playsound minecraft:block.scaffolding.fall ambient @a[distance=..15] ~ ~ ~ 1 .5

# break ladder and drop item
setblock ~ ~ ~ air
loot spawn ~ ~ ~ loot minecraft:blocks/ladder
