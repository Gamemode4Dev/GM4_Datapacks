
data merge entity @s {Silent:1b,HasVisualFire:1b,LifeTime:400,ShotAtAngle:1b,Motion:[0.0,-0.5,0.0],Tags:["gm4_ce_boss.small_fireball"],FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;9570559]},{shape:"burst",colors:[I;7014075]},{shape:"burst",colors:[I;5637526]},{shape:"burst",colors:[I;3998827]}]}}}}

# get player pos
execute positioned ^ ^ ^3 summon marker run function gm4_combat_expanded:boss/watchers/running/attack/fireball/get_target_pos

# get vector
data modify storage gm4_combat_expanded:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[0] 100
execute store result score $motion_y gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[1] 100
execute store result score $motion_z gm4_ce_boss run data get storage gm4_combat_expanded:temp Pos[2] 100

execute store result score $motion_x_offset gm4_ce_boss run random value -12..12
execute store result score $motion_y_offset gm4_ce_boss run random value -12..12
execute store result score $motion_z_offset gm4_ce_boss run random value -12..12

scoreboard players operation $target_x gm4_ce_boss += $motion_x_offset gm4_ce_boss
scoreboard players operation $target_y gm4_ce_boss += $motion_y_offset gm4_ce_boss
scoreboard players operation $target_z gm4_ce_boss += $motion_z_offset gm4_ce_boss

scoreboard players operation $motion_x gm4_ce_boss -= $target_x gm4_ce_boss
scoreboard players operation $motion_y gm4_ce_boss -= $target_y gm4_ce_boss
scoreboard players operation $motion_z gm4_ce_boss -= $target_z gm4_ce_boss

# set motion
execute store result entity @s Motion[0] double -0.00225 run scoreboard players get $motion_x gm4_ce_boss
execute store result entity @s Motion[1] double -0.00225 run scoreboard players get $motion_y gm4_ce_boss
execute store result entity @s Motion[2] double -0.00225 run scoreboard players get $motion_z gm4_ce_boss

data remove storage gm4_combat_expanded:temp Pos
