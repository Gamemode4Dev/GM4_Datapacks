# Place tripwire hook at end of tripwire
# @s = player using the crossbow
# at @s align xyz positioned ~0.5 ~ ~0.5, up to 40 blocks in one of the cardinal directions
# run from cables/unspool_string

# check direction and place tripwire hook
execute if block ~1 ~ ~ minecraft:tripwire[east=true,attached=false] if block ~-1 ~ ~ #gm4:full_collision run setblock ~ ~ ~ minecraft:tripwire_hook[facing=east] destroy
execute if block ~-1 ~ ~ minecraft:tripwire[west=true,attached=false] if block ~1 ~ ~ #gm4:full_collision run setblock ~ ~ ~ minecraft:tripwire_hook[facing=west] destroy
execute if block ~ ~ ~1 minecraft:tripwire[south=true,attached=false] if block ~ ~ ~-1 #gm4:full_collision run setblock ~ ~ ~ minecraft:tripwire_hook[facing=south] destroy
execute if block ~ ~ ~-1 minecraft:tripwire[north=true,attached=false] if block ~ ~ ~1 #gm4:full_collision run setblock ~ ~ ~ minecraft:tripwire_hook[facing=north] destroy

playsound minecraft:block.stone.place block @a[distance=..15]
clear @s[gamemode=!creative] minecraft:tripwire_hook 1

# 40 block long tripwire advancement
execute if score @s gm4_cb_strplace matches 40 run advancement grant @s only gm4:crossbow_cartridges_string
