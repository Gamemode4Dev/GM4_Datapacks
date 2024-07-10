
# teleport up to 8 blocks away
tag @s add gm4_ce_target
execute summon marker run function gm4_combat_expanded:mob/process/elite/fear/warp/spawn_marker
tag @s remove gm4_ce_target

playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.75

execute at @s run particle minecraft:portal ~ ~1.75 ~ 0 0 0 0.75 32
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.75
