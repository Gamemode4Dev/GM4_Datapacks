# tick pierced effect on entity affected by it
# @s = entity that pierced is applied to
# at @s
# run from main

scoreboard players remove @s gm4_ce_pierce_timer 1
execute if score @s gm4_ce_pierce_timer matches ..0 run attribute @s generic.armor modifier remove gm4_combat_expanded:pierced_armor
particle minecraft:item{item:"minecraft:shield"} ~ ~1 ~ 0.24 0.44 0.24 0 6
