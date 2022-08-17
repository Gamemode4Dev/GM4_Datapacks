# checks for ageable mobs
# @s = everstone item on ground
# located at @s
# run from main

tag @s add gm4_everstone_used
tag @e[distance=..1,type=#gm4_everstone:affected,limit=1,tag=!gm4_everstone_locked,tag=!smithed.entity,sort=nearest] add gm4_everstone_check
function #gm4_everstone:age_locking_check

execute as @e[type=#gm4_everstone:affected,distance=..1,tag=gm4_everstone_check,limit=1] store result score @s gm4_es_data run data get entity @s Age
scoreboard players set @e[type=#gm4_everstone:aging_mob,distance=..1,tag=gm4_everstone_check,limit=1] gm4_es_data -1
execute as @e[type=#gm4_everstone:affected,distance=..1,tag=gm4_everstone_check,limit=1,scores={gm4_es_data=..-1}] at @s run function gm4_everstone:age_locking/lock_age
scoreboard players reset @e[distance=..1] gm4_es_data
tag @e[distance=..1] remove gm4_everstone_check
tag @s remove gm4_everstone_used
