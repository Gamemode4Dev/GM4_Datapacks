# spawn a marker and start the moving of it
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/attempt

tag @s add gm4_ce_vorpal
tp @s ~-8 ~ ~-8
execute store result score $y_pos gm4_ce_data run data get entity @s Pos[1]
scoreboard players set $warp_attempt gm4_ce_data 0

function gm4_combat_expanded:armor/modifier/type/vorpal/randomize
