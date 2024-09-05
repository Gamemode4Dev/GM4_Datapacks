# spawn a marker and start the moving of it
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/attempt

tag @s add gm4_ce_boss.warp_locator
execute store result score $warp_offset_direction gm4_ce_boss run random value 1..4
execute if score $warp_offset_direction gm4_ce_boss matches 1 at @r[gamemode=!spectator,gamemode=!creative,distance=..64] run tp @s ~-11 ~ ~-11
execute if score $warp_offset_direction gm4_ce_boss matches 2 at @r[gamemode=!spectator,gamemode=!creative,distance=..64] run tp @s ~3 ~ ~-11
execute if score $warp_offset_direction gm4_ce_boss matches 3 at @r[gamemode=!spectator,gamemode=!creative,distance=..64] run tp @s ~-11 ~ ~3
execute if score $warp_offset_direction gm4_ce_boss matches 4 at @r[gamemode=!spectator,gamemode=!creative,distance=..64] run tp @s ~3 ~ ~3
execute store result score $y_pos gm4_ce_boss run data get entity @s Pos[1]
scoreboard players set $warp_attempt gm4_ce_boss 0

function gm4_combat_expanded:boss/watchers/running/attack/warp/pick_location_far/randomize

execute if score $warp_safe gm4_ce_boss matches 1 at @s align xyz run tp @e[type=shulker,tag=gm4_ce_target] ~ ~ ~
kill @s
