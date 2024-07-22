
# before show warning
particle dust{color:[0.725,0.910,0.918],scale:3} ~ ~ ~ 0.04 0.04 0.04 0 4 normal
particle snowflake ~ ~ ~ 1.75 1.75 1.75 0 7 normal
scoreboard players set $frost_ring_yaw gm4_ce_data 0
execute if score @s gm4_ce_data matches ..360 rotated 0 80 run function gm4_combat_expanded:mob/process/elite/glacial/warning_yaw_loop

# explode after 2 seconds
scoreboard players add @s gm4_ce_data 20

playsound minecraft:block.snow.break hostile @a[distance=..4.81] ~ ~ ~ 1.55 1.2
playsound minecraft:block.snow.fall hostile @a[distance=..4.81] ~ ~ ~ 2 0.75
playsound minecraft:block.snow.fall hostile @a[distance=4.81..16] ~ ~ ~ 1 0.6

execute if score @s gm4_ce_data matches 400.. run return run function gm4_combat_expanded:mob/process/elite/glacial/explode
scoreboard players set $keep_tick.elite_glacial_death gm4_ce_keep_tick 1
