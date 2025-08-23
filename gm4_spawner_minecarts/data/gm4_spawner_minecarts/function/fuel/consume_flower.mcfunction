#@s = flower_checker area_effect_cloud inside a consumable block
#run from fuel/analyze_consumable_block

execute if block ~ ~ ~ red_tulip if score red_tulip gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ red_tulip if score red_tulip gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ orange_tulip if score orange_tulip gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ orange_tulip if score orange_tulip gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ white_tulip if score white_tulip gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ white_tulip if score white_tulip gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ pink_tulip if score pink_tulip gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ pink_tulip if score pink_tulip gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ oxeye_daisy if score oxeye_daisy gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ oxeye_daisy if score oxeye_daisy gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ dandelion if score dandelion gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ dandelion if score dandelion gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ blue_orchid if score blue_orchid gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ blue_orchid if score blue_orchid gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ allium if score allium gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ allium if score allium gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ azure_bluet if score azure_bluet gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ azure_bluet if score azure_bluet gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ poppy if score poppy gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ poppy if score poppy gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ cornflower if score cornflower gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ cornflower if score cornflower gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower
execute if block ~ ~ ~ lily_of_the_valley if score lily_of_the_valley gm4_sm_flowers matches 1 run function gm4_spawner_minecarts:fuel/consume_poisonous_flower
execute if block ~ ~ ~ lily_of_the_valley if score lily_of_the_valley gm4_sm_flowers matches 0 run function gm4_spawner_minecarts:fuel/consume_normal_flower

#summon pretty entity line
summon area_effect_cloud ~ ~ ~ {Radius:0.0f,Tags:["gm4_spawner_minecart_decorative_particle","gm4_unrotated_particle_cloud"],Duration:200,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},CustomName:"Spawner Minecart Decorative Particle"}
teleport @e[type=area_effect_cloud,tag=gm4_unrotated_particle_cloud,limit=1] ~ ~ ~ facing entity @e[type=spawner_minecart,tag=gm4_processing_spawner,limit=1] eyes
tag @e[type=area_effect_cloud,tag=gm4_unrotated_particle_cloud] remove gm4_unrotated_particle_cloud

# sounds
playsound minecraft:block.candle.extinguish block @a[distance=..8] ~ ~ ~ 1 0.6
