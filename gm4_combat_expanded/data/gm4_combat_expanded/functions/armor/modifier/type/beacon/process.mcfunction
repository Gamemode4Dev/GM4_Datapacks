# process the beacon linked to this player
# @s = beacon block_display
# at linked player
# run from armor/modifier/type/beacon/prep

# calculate offset every 3 seconds
scoreboard players add @s gm4_ce_data 1
execute if score @s gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/beacon/pick_new_offset
scoreboard players set @s[scores={gm4_ce_data=60..}] gm4_ce_data 0

# remove old beacon light
execute at @s run fill ~ ~ ~ ~ ~-1 ~ air replace light[waterlogged=false,level=14]
execute at @s run fill ~ ~ ~ ~ ~-1 ~ water replace light[waterlogged=true,level=9]

# tp beacon to above the player
tp @s ~ ~2.5 ~ 0 0

# place new beacon light
execute at @s run fill ~ ~ ~ ~ ~-1 ~ light[waterlogged=true,level=9] replace water[level=0]
execute at @s run fill ~ ~ ~ ~ ~-1 ~ light[level=14] replace #gm4:air

# tags
tag @s remove gm4_ce_beacon.process
tag @s add gm4_ce_beacon.keep
