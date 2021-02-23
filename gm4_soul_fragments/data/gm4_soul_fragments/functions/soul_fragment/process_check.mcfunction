# @s = soul fragment
# at @s
# from main

# check if there are items or players nearby before further processing
execute if entity @a[distance=..17] run function gm4_soul_fragments:soul_fragment/process

# check if there is soul fire (of any kind) nearby
execute store result score @s gm4_sf_fire run clone ~-2 ~-1 ~-2 ~2 ~2 ~2 ~-2 ~-1 ~-2 filtered #gm4_soul_fragments:sf_fire force
execute if score @s gm4_sf_fire matches 0 run execute store result score @s gm4_sf_fire run clone ~-2 ~-1 ~-2 ~2 ~2 ~2 ~-2 ~-1 ~-2 filtered minecraft:soul_campfire[lit=true] force

# if there isn't soul fire, increase age
execute as @s[scores={gm4_sf_fire=0}] run scoreboard players add @s gm4_sf_timer 1

# dissipate after ~30 minutes of not being around soul fire
execute if score @s gm4_sf_timer matches 2250 at @s run function gm4_soul_fragments:soul_fragment/dissipate
