# tick pierced effect on entity affected by it
# @s = entity that pierced is applied to
# at @s
# run from main

scoreboard players remove @s gm4_ce_pierce_timer 1
execute if score @s gm4_ce_pierce_timer matches ..0 run attribute @s generic.armor modifier remove df679fe3-2d2a-429f-9dea-55a030b50964
particle minecraft:item{item:"minecraft:shield"} ~ ~1 ~ 0.24 0.44 0.24 0 6
