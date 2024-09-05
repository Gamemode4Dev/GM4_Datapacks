# code taken from Orb of Ankou - expeditious
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/randomize

execute at @s if score $randomX gm4_ce_boss matches 2.. run tp @s ~2 ~ ~
execute if score $randomX gm4_ce_boss matches 2.. run scoreboard players remove $randomX gm4_ce_boss 2
execute at @s if score $randomX gm4_ce_boss matches 1.. run tp @s ~1 ~ ~
execute if score $randomX gm4_ce_boss matches 1.. run scoreboard players remove $randomX gm4_ce_boss 1

execute at @s if score $randomZ gm4_ce_boss matches 2.. run tp @s ~ ~ ~2
execute if score $randomZ gm4_ce_boss matches 2.. run scoreboard players remove $randomZ gm4_ce_boss 2
execute at @s if score $randomZ gm4_ce_boss matches 1.. run tp @s ~ ~ ~1
execute if score $randomZ gm4_ce_boss matches 1.. run scoreboard players remove $randomZ gm4_ce_boss 1

execute store result entity @s Pos[1] double 1 run scoreboard players get $y_pos gm4_ce_boss
execute at @s run tp @s ~ ~2 ~
scoreboard players set $set_y gm4_ce_boss 0
execute at @s run function gm4_combat_expanded:boss/watchers/running/attack/warp/pick_location_near/set_ypos

scoreboard players add $warp_attempt gm4_ce_boss 1
execute unless score $warp_attempt gm4_ce_boss matches 33.. run function gm4_combat_expanded:boss/watchers/running/attack/warp/pick_location_near/randomize
