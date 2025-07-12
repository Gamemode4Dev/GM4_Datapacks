#@s = spawner minecarts
#run from process

tag @s add gm4_processing_spawner
summon area_effect_cloud ~-4 ~ ~-4 {Radius:0.0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},Duration:10,CustomName:"gm4_spawner_flower_checker",Tags:["gm4_spawner_flower_checker"]}

#calculate random position
execute store result score randomX gm4_spawner_fuel run data get entity @e[tag=gm4_spawner_flower_checker,limit=1] UUID[0]
scoreboard players operation randomZ gm4_spawner_fuel = randomX gm4_spawner_fuel

scoreboard players set 10 gm4_spawner_fuel 10
scoreboard players operation randomZ gm4_spawner_fuel %= 10 gm4_spawner_fuel

scoreboard players set 9 gm4_spawner_fuel 9
scoreboard players operation randomX gm4_spawner_fuel %= 9 gm4_spawner_fuel
scoreboard players operation randomZ gm4_spawner_fuel %= 9 gm4_spawner_fuel

#move the entity
execute as @e[tag=gm4_spawner_flower_checker] at @s run function gm4_spawner_minecarts:fuel/check_for_consumable_block

tag @s[scores={gm4_spawner_fuel=2000..}] add gm4_spawner_minecart_full

tag @s remove gm4_processing_spawner
