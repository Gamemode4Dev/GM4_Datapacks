# code taken from Orb of Ankou - expeditious
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/context

tag @s remove gm4_ce_vorpal_start

# teleport up to 8 blocks away
summon marker ~ ~ ~ {Tags:["gm4_ce_vorpal"]}
execute at @s run tp @e[tag=gm4_ce_vorpal] ~-8 ~ ~-8

execute store result score $y_pos gm4_ce_data run data get entity @s Pos[1]
execute store result score $randomX gm4_ce_data run data get entity @e[tag=gm4_ce_vorpal,limit=1] UUID[0]
scoreboard players set $warp_attempt gm4_ce_data 0
function gm4_combat_expanded:armor/modifier/type/vorpal/randomize

execute if score $warp_safe gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/vorpal/tp_player
execute if score $warp_safe gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe

# effects
particle reverse_portal ~ ~0.8 ~ 0.2 0.4 0.2 0.1 16
