# @s = player with dashing pneuma who stopped sneaking
# run from pneumas/sneak/stopped

execute rotated ~ 0 if block ^ ^0.9 ^.1 #gm4:no_collision if block ^ ^0.5 ^1.1 #gm4:no_collision run summon armor_stand ^ ^0.5 ^1 {Invisible:1b,Small:1b,Invulnerable:1b,CustomName:'"Dashing Stand"',Tags:["gm4_oa_dasher","gm4_oa_new_dasher","smithed.entity","smithed.strict"],attributes:[{id:"generic.max_health",base:1.0}]}
scoreboard players operation $current gm4_oa_id = @s gm4_oa_id

# store player pos
data modify storage gm4_oa_dashing:temp Pos set from entity @s Pos
execute store result score $target_x gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[0] 100
execute store result score $target_z gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[2] 100

# store sneak count
execute if score @s gm4_oa_snk_num matches 10..19 run scoreboard players set $multiplier gm4_pneuma_data 1
execute if score @s gm4_oa_snk_num matches 20..39 run scoreboard players set $multiplier gm4_pneuma_data 2
execute if score @s gm4_oa_snk_num matches 40..59 run scoreboard players set $multiplier gm4_pneuma_data 3
execute if score @s gm4_oa_snk_num matches 60.. run scoreboard players set $multiplier gm4_pneuma_data 4

# give armor stand motion
ride @s mount @e[type=armor_stand,tag=gm4_oa_new_dasher,distance=..3,limit=1]
execute as @e[type=armor_stand,tag=gm4_oa_new_dasher,distance=..3,limit=1] at @s run function gm4_orb_of_ankou:pneumas/dashing/set_motion
tag @e[type=armor_stand,tag=gm4_oa_new_dasher,distance=..3,limit=1] remove gm4_oa_new_dasher
playsound minecraft:entity.player.small_fall player @a[distance=..8] ~ ~ ~ 0.7 0.6

# keep player on dash trajectory
schedule function gm4_orb_of_ankou:pneumas/dashing/temp_tick 1t
