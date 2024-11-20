
playsound block.amethyst_block.break hostile @a[distance=..32] ~ ~ ~ 1.5 0.7 1

data merge entity @s {ExplosionPower:3b,Tags:["gm4_ce_boss.fireball"],acceleration_power:-0.05,Item:{id:"minecraft:budding_amethyst",count:1}}
summon dragon_fireball ~ ~ ~ {Tags:["gm4_ce_boss.fireball","gm4_ce_boss.watcher.dragon_fireball"],acceleration_power:-2.0}
ride @e[type=dragon_fireball,tag=gm4_ce_boss.watcher.dragon_fireball,distance=..0.1,limit=1] mount @s

# get player pos
execute positioned ^ ^ ^3 summon marker run function gm4_combat_expanded:boss/watchers/running/attack/fireball/get_target_pos

# get vector
data modify storage gm4_combat_expanded:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[0] 100
execute store result score $motion_y gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[1] 100
execute store result score $motion_z gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[2] 100

scoreboard players operation $motion_x gm4_ce_boss -= $target_x gm4_ce_boss
scoreboard players operation $motion_y gm4_ce_boss -= $target_y gm4_ce_boss
scoreboard players operation $motion_z gm4_ce_boss -= $target_z gm4_ce_boss

# set motion
execute store result entity @s power[0] double -0.000275 run scoreboard players get $motion_x gm4_ce_boss
execute store result entity @s power[1] double -0.000275 run scoreboard players get $motion_y gm4_ce_boss
execute store result entity @s power[2] double -0.000275 run scoreboard players get $motion_z gm4_ce_boss

data remove storage gm4_combat_expanded:temp Pos
