# if no solid block above, fail
execute unless block ~ ~1 ~ #minecraft:blocks_motion run return run function gm4_swings:place/fail with block ~ ~ ~

# if swing already here, fail
execute positioned ~ ~0.5 ~ if entity @n[type=minecraft:item_display,tag=gm4_swings.swing,distance=..1] run return run function gm4_swings:place/fail with block ~ ~ ~

execute store result score $max_length gm4_swings.dummy run data get storage gm4_swings:constants max_length
scoreboard players set $length gm4_swings.dummy 0

# calculate max possible length
execute positioned ~ ~-1 ~ run function gm4_swings:place/length/loop

# sooound
playsound minecraft:item.lead.tied block @a ~ ~ ~ 0.5 1.5
playsound minecraft:block.bamboo_wood.place block @a ~ ~ ~ 1 1

# figure out direction and place
execute store result storage gm4_swings:temp length int 1 run scoreboard players get $length gm4_swings.dummy
data modify storage gm4_swings:temp item_model set from block ~ ~ ~ components."minecraft:item_model"
data modify storage gm4_swings:temp custom_data set from block ~ ~ ~ components."minecraft:custom_data"
execute positioned ~ ~0.975 ~ run function gm4_swings:place/place

# remove head
setblock ~ ~ ~ minecraft:air