# run from aging
# @s = all players not in specator mode

execute as @e[type=#gm4_everstone:aging_mob,tag=!gm4_everstone_locked,limit=45,sort=random,distance=..128] at @s run function gm4_everstone:aging/check_mob

scoreboard players add @e[tag=gm4_es_aging,limit=1,sort=random] gm4_es_age 1
scoreboard players remove @e[tag=gm4_es_deaging,limit=1,sort=random] gm4_es_age 1
tag @e[type=#gm4_everstone:aging_mob] remove gm4_es_aging
tag @e[type=#gm4_everstone:aging_mob] remove gm4_es_deaging
