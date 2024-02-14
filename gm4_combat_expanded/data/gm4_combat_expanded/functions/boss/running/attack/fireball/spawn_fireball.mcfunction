

data merge entity @s {ExplosionPower:2b,Tags:["gm4_ce_boss.fireball"],power:[0.0,-0.05,0.0],Item:{id:"minecraft:budding_amethyst",Count:1b}}

# get player pos
execute positioned ^ ^ ^3 summon marker run function gm4_combat_expanded:boss/running/attack/fireball/get_target_pos

# get vector
data modify storage gm4_combat_expanded:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[0] 
execute store result score $motion_y gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[1] 
execute store result score $motion_z gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[2] 

scoreboard players operation $motion_x gm4_ce_boss -= $target_x gm4_ce_boss
scoreboard players operation $motion_y gm4_ce_boss -= $target_y gm4_ce_boss
scoreboard players operation $motion_z gm4_ce_boss -= $target_z gm4_ce_boss

# set motion
execute store result entity @s power[0] double -0.025 run scoreboard players get $motion_x gm4_ce_boss
execute store result entity @s power[1] double -0.025 run scoreboard players get $motion_y gm4_ce_boss
execute store result entity @s power[2] double -0.025 run scoreboard players get $motion_z gm4_ce_boss

data remove storage gm4_combat_expanded:temp Pos
