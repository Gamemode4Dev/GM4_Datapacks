# code taken from Orb of Ankou - expeditious
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/tp_marker

execute at @s run tp @s ~ ~-1 ~
scoreboard players add $set_y gm4_ce_boss 1
scoreboard players set $warp_safe gm4_ce_boss 0
execute at @s unless entity @e[type=shulker,tag=gm4_ce_boss,distance=..0.5] if block ~ ~ ~ #gm4:air if block ~ ~-1 ~ #gm4:no_collision unless block ~ ~-2 ~ #gm4:no_collision align xyz unless entity @e[type=minecraft:area_effect_cloud,dx=0,dy=0,dz=0] run scoreboard players set $warp_safe gm4_ce_boss 1
execute if score $warp_safe gm4_ce_boss matches 1 run scoreboard players set $warp_attempt gm4_ce_boss 33
execute unless score $set_y gm4_ce_boss matches 17.. at @s unless score $warp_safe gm4_ce_boss matches 1 run function gm4_combat_expanded:boss/watchers/running/attack/warp/pick_location_low/set_ypos
