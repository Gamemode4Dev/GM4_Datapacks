
# teleport up to 8 blocks away
tag @s add gm4_ce_target
execute store result score $pick_location gm4_ce_boss run random value 1..2
execute if score $pick_location gm4_ce_boss matches 1 summon marker run function gm4_combat_expanded:boss/running/attack/warp/pick_location_high/spawn_marker
execute if score $pick_location gm4_ce_boss matches 2 summon marker run function gm4_combat_expanded:boss/running/attack/warp/pick_location_low/spawn_marker
tag @s remove gm4_ce_target

execute at @s as @e[tag=gm4_ce_boss.running,distance=0.1..] run tp @s ~ ~.5 ~
execute at @s run particle minecraft:portal ~ ~1.75 ~ 0 0 0 0.75 32
tp @e[type=item_display,tag=gm4_ce_boss.teleport_display,limit=1,sort=nearest] @s

playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.75
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.75
