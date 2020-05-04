#@s = fishing bobber positioned ~ ~-5 ~
#run from tick

summon minecraft:armor_stand ~ ~ ~ {DisabledSlots:2039552,Small:1,Invisible:1,NoGravity:1b,Tags:["gm4_no_edit","gm4_fishing_bait_set"]}

scoreboard players operation @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_fishing_bait_set] gm4_ef_id = @s gm4_ef_id

scoreboard players operation @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_fishing_bait_set] gm4_ef_lure = @s gm4_ef_lure

execute as @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_fishing_bait_set] run function gm4_end_fishing:cast_rod/randomize_timer

tag @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_fishing_bait_set] add gm4_fishing_bait
tag @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_fishing_bait_set,tag=gm4_fishing_bait] remove gm4_fishing_bait_set

tag @s add gm4_ef_casted
