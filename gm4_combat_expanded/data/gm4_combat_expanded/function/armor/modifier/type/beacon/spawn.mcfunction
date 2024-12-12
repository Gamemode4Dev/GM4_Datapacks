# create a beacon at players that don't have one linked to them yet
# @s = player
# at @s
# run from armor/modifier/type/beacon/prep

# this doesn't use execute summon as data merge cannot add passengers
summon block_display ~ ~2.5 ~ {teleport_duration:2,Tags:["gm4_ce_beacon","gm4_ce_beacon.process","gm4_ce_beacon.main"],Passengers:[{id:"minecraft:block_display",Tags:["gm4_ce_beacon","gm4_ce_beacon.passenger"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.21875f,-0.21875f,-0.21875f],scale:[0.4375f,0.4375f,0.4375f]},block_state:{Name:"minecraft:verdant_froglight"}}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-.25f,-.25f,-.25f],scale:[0.5f,0.5f,0.5f]},block_state:{Name:"minecraft:glass"}}
scoreboard players operation @e[type=block_display,tag=gm4_ce_beacon.process] gm4_ce_id = $player_id gm4_ce_id 

execute store result score $light_colour gm4_ce_data run random value 1..3
execute if score $light_colour gm4_ce_data matches 2 as @e[type=block_display,tag=gm4_ce_beacon.process] on passengers run data modify entity @s block_state.Name set value "minecraft:pearlescent_froglight"
execute if score $light_colour gm4_ce_data matches 3 as @e[type=block_display,tag=gm4_ce_beacon.process] on passengers run data modify entity @s block_state.Name set value "minecraft:ochre_froglight"
