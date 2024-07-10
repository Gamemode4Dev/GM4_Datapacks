
execute store result score $y_pos gm4_ce_data run data get entity @s Pos[1]
scoreboard players set $warp_attempt gm4_ce_data 0

function gm4_combat_expanded:mob/process/elite/fear/warp/randomize

execute if score $warp_safe gm4_ce_data matches 1 at @s align xyz run tp @e[type=#gm4_combat_expanded:elite_types,tag=gm4_ce_target] ~.5 ~ ~.5
kill @s
