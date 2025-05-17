# @s = player with dashing pneuma who stopped sneaking
# run from pneumas/sneak/stopped

execute rotated ~ 0 if block ^ ^0.9 ^.1 #gm4:no_collision if block ^ ^0.5 ^1.1 #gm4:no_collision run summon marker ^ ^0.5 ^1 {CustomName:"Dashing Vector",Tags:["gm4_oa_dash_vector"]}
scoreboard players operation $current gm4_oa_id = @s gm4_oa_id

# store player pos
data modify storage gm4_oa_dashing:temp Pos set from entity @s Pos
execute store result score $target_x gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[0] 1000
execute store result score $target_z gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[2] 1000

# store sneak count
execute if score @s gm4_oa_snk_num matches 10..19 run scoreboard players set $multiplier gm4_pneuma_data 8
execute if score @s gm4_oa_snk_num matches 20..39 run scoreboard players set $multiplier gm4_pneuma_data 14
execute if score @s gm4_oa_snk_num matches 40..59 run scoreboard players set $multiplier gm4_pneuma_data 18
execute if score @s gm4_oa_snk_num matches 60.. run scoreboard players set $multiplier gm4_pneuma_data 24

# set motion
tag @s add gm4_oa_dasher
execute as @e[type=marker,tag=gm4_oa_dash_vector,distance=..3,limit=1] run function gm4_orb_of_ankou:pneumas/dashing/set_motion
tag @s remove gm4_oa_dasher

playsound minecraft:entity.player.small_fall player @a[distance=..8] ~ ~ ~ 0.7 0.6
