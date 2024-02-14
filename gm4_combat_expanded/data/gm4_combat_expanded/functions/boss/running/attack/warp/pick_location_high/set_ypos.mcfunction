# code taken from Orb of Ankou - expeditious
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/tp_marker

execute at @s run tp @s ~ ~-1 ~
scoreboard players add $set_y gm4_ce_boss 1
scoreboard players set $warp_safe gm4_ce_boss 0
execute at @s if block ~ ~ ~ #gm4:replaceable if block ~ ~-1 ~ #gm4:no_collision run scoreboard players set $warp_safe gm4_ce_boss 1
execute if score $warp_safe gm4_ce_boss matches 1 run scoreboard players set $warp_attempt gm4_ce_boss 33
execute unless score $set_y gm4_ce_boss matches 7.. at @s unless score $warp_safe gm4_ce_boss matches 1 run function gm4_combat_expanded:boss/running/attack/warp/pick_location_high/set_ypos
