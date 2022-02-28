# run from mobs/effects/poison_landing/process
# @s = slime/magma cube that landed

execute store result score $cube_size gm4_ai_data run data get entity @s Size

tag @s remove gm4_ai_poison_landing_ready

execute if score $cube_size gm4_ai_data matches 0 run particle block slime_block ~ ~ ~ 0.1 0 0.1 0.1 1
execute if score $cube_size gm4_ai_data matches 1 run particle block slime_block ~ ~ ~ 0.1 0 0.1 0.1 4
execute if score $cube_size gm4_ai_data matches 2 run particle block slime_block ~ ~ ~ 0.5 0 0.5 0.1 9
execute if score $cube_size gm4_ai_data matches 3 run particle block slime_block ~ ~ ~ 1 0 1 0.1 16
execute if score $cube_size gm4_ai_data matches 4.. run particle block slime_block ~ ~ ~ 2 0 2 0.1 25

execute if score $cube_size gm4_ai_data matches 0 run effect give @a[gamemode=!creative,gamemode=!spectator,distance=..1] poison 1 0
execute if score $cube_size gm4_ai_data matches 1 run effect give @a[gamemode=!creative,gamemode=!spectator,distance=..2] poison 2 0
execute if score $cube_size gm4_ai_data matches 2 run effect give @a[gamemode=!creative,gamemode=!spectator,distance=..2.5] poison 2 1
execute if score $cube_size gm4_ai_data matches 3 run effect give @a[gamemode=!creative,gamemode=!spectator,distance=..3] poison 2 2
execute if score $cube_size gm4_ai_data matches 4.. run effect give @a[gamemode=!creative,gamemode=!spectator,distance=..4] poison 2 3
