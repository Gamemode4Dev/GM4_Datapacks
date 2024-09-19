# checks what the player/armor stand is holding
# @s = player or armor stand, wearing Boots of Ostara
# at @s
# run from main

# make sure moss/mycelium checks are run before grass, so grass isn't instantly converted to either
# this rule replaces the old "check if grass was converted" check

# first run, check mainhand
execute if items entity @s weapon.mainhand moss_block if block ~ ~-0.5 ~ #gm4_boots_of_ostara:moss_replaceable run setblock ~ ~-0.5 ~ moss_block
execute if items entity @s weapon.mainhand mycelium if block ~ ~-0.5 ~ #gm4_boots_of_ostara:mycelium_replaceable run setblock ~ ~-0.5 ~ mycelium
execute if items entity @s weapon.mainhand grass_block if block ~ ~-0.5 ~ #minecraft:dirt run setblock ~ ~-0.5 ~ grass_block
execute if items entity @s weapon.mainhand crimson_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ crimson_nylium
execute if items entity @s weapon.mainhand warped_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ warped_nylium

# now go through offhand
execute if items entity @s weapon.offhand moss_block if block ~ ~-0.5 ~ #gm4_boots_of_ostara:moss_replaceable run setblock ~ ~-0.5 ~ moss_block
execute if items entity @s weapon.offhand mycelium if block ~ ~-0.5 ~ #gm4_boots_of_ostara:mycelium_replaceable run setblock ~ ~-0.5 ~ mycelium
execute if items entity @s weapon.offhand grass_block if block ~ ~-0.5 ~ #minecraft:dirt run setblock ~ ~-0.5 ~ grass_block
execute if items entity @s weapon.offhand crimson_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ crimson_nylium
execute if items entity @s weapon.offhand warped_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ warped_nylium
