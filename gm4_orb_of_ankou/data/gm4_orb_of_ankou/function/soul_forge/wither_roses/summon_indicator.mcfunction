# @s = soul forge with an orb and shard
# run from soul_forge/wither_roses/steps

summon marker ~-6 ~1 ~-6 {CustomName:'"gm4_oa_wither_rose_catcher"',Tags:["gm4_oa_wither_rose_catcher","gm4_oa_unset"]}

#calculate random position
execute store result score random_x gm4_oa_roses run data get entity @e[type=marker,tag=gm4_oa_wither_rose_catcher,tag=gm4_oa_unset,limit=1] UUID[0]
scoreboard players operation random_z gm4_oa_roses = random_x gm4_oa_roses

scoreboard players set modulo_1 gm4_oa_roses 13
scoreboard players operation random_z gm4_oa_roses %= modulo_1 gm4_oa_roses

scoreboard players set modulo_2 gm4_oa_roses 12
scoreboard players operation random_x gm4_oa_roses %= modulo_2 gm4_oa_roses
scoreboard players operation random_z gm4_oa_roses %= modulo_2 gm4_oa_roses

#move the entity
execute as @e[type=marker,tag=gm4_oa_wither_rose_catcher,tag=gm4_oa_unset] at @s run function gm4_orb_of_ankou:soul_forge/wither_roses/move_indicator

tag @e[type=marker,tag=gm4_oa_wither_rose_catcher,tag=gm4_oa_unset] remove gm4_oa_unset
