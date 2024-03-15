# objectives
scoreboard objectives add gm4_shroom_data dummy
scoreboard objectives add gm4_entity_version dummy

# fixed values
scoreboard players set #spore_max_age gm4_shroom_data 12
scoreboard players set #spore_placement_cooldown gm4_shroom_data 8
scoreboard players set #shroom_placement_cooldown gm4_shroom_data 64
scoreboard players set #fertilization_cost gm4_shroom_data 2
scoreboard players set #conversion_cost gm4_shroom_data 16
execute unless score #global_spore_cap gm4_shroom_data matches -2147483648..2147483647 run scoreboard players set #global_spore_cap gm4_shroom_data 2048
execute unless score #global_shroom_cap gm4_shroom_data matches -2147483648..2147483647 run scoreboard players set #global_shroom_cap gm4_shroom_data 1024

execute unless score shroomites gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Shroomites"}
execute unless score shroomites gm4_earliest_version < shroomites gm4_modules run scoreboard players operation shroomites gm4_earliest_version = shroomites gm4_modules
scoreboard players set shroomites gm4_modules 1

schedule function gm4_shroomites:main 1t
schedule function gm4_shroomites:slow_clock 32t



#$moduleUpdateList
