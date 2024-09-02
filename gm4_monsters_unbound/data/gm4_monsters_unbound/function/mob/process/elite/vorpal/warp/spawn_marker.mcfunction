# get random teleport location
# @s = marker
# at @s
# run from clocks/elite/vorpal/warp/run

execute store result score $y_pos gm4_mu_data run data get entity @s Pos[1]
scoreboard players set $warp_attempt gm4_mu_data 0

function gm4_monsters_unbound:mob/process/elite/vorpal/warp/randomize

execute if score $warp_safe gm4_mu_data matches 1 at @s align xyz run tp @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_target] ~.5 ~ ~.5
kill @s
