# process gm4 horses, variants, donkeys and mules
# @s = tamed gm4_horse
# at @s
# run from main

# check health cap
function gm4_horsemanship:horse_processing/cap_health

## | Health Status
# health should always be slightly below max, to allow for feeding the horse at any time
execute store result score $max_health gm4_horse_data run attribute @s max_health get 100
scoreboard players remove $max_health gm4_horse_data 101
execute store result score $curr_health gm4_horse_data run data get entity @s Health 100
execute if score $curr_health gm4_horse_data > $max_health gm4_horse_data store result entity @s Health float 0.01 run scoreboard players get $max_health gm4_horse_data

## | Riding Status
# stores all relevant statuses of the horse in scores
scoreboard players set $mounted gm4_horse_data 0
scoreboard players set $riding gm4_horse_data 0
execute store success score $mounted gm4_horse_data on controller if entity @s[type=player]
execute if score $mounted gm4_horse_data matches 1 on controller store result score $riding gm4_horse_data if predicate gm4_horsemanship:riding
execute store result score $on_ground gm4_horse_data run data get entity @s OnGround

# glider
execute if items entity @s[tag=!gm4_horse.glider_disabled] armor.body *[custom_data~{gm4_horsemanship:{glider:{}}}] run function gm4_horsemanship:horse_processing/glider/process
execute unless items entity @s[tag=gm4_horse.gliding] armor.body *[custom_data~{gm4_horsemanship:{glider:{}}}] run function gm4_horsemanship:horse_processing/glider/ground

# stop grazing if horse is being ridden
execute if score $riding gm4_horse_data matches 1 if entity @s[nbt={EatingHaystack:1b}] run function gm4_horsemanship:horse_processing/graze/cancel

# copy frost walking level on rider's boots
execute store result score $stored_frost_walker_level gm4_horse_data run data get entity @s equipment.feet.components."minecraft:enchantments"."minecraft:frost_walker"
execute on controller run item replace block 29999998 1 7134 container.0 from entity @s[type=player] armor.feet
execute store result score $set_frost_walker_level gm4_horse_data run data get block 29999998 1 7134 Items[0].components."minecraft:enchantments"."minecraft:frost_walker"
execute unless score $stored_frost_walker_level gm4_horse_data = $set_frost_walker_level gm4_horse_data store result entity @s equipment.feet.components."minecraft:enchantments"."minecraft:frost_walker" int 1 run scoreboard players operation $stored_frost_walker_level gm4_horse_data = $set_frost_walker_level gm4_horse_data

# copy feather falling level on rider's boots
execute store result score $stored_feather_falling_level gm4_horse_data run data get entity @s equipment.feet.components."minecraft:enchantments"."minecraft:feather_falling"
execute on controller run item replace block 29999998 1 7134 container.0 from entity @s[type=player] armor.feet
execute store result score $set_feather_falling_level gm4_horse_data run data get block 29999998 1 7134 Items[0].components."minecraft:enchantments"."minecraft:feather_falling"
execute unless score $stored_feather_falling_level gm4_horse_data = $set_feather_falling_level gm4_horse_data store result entity @s equipment.feet.components."minecraft:enchantments"."minecraft:feather_falling" int 1 run scoreboard players operation $stored_feather_falling_level gm4_horse_data = $set_feather_falling_level gm4_horse_data

# reduce experience to next level as horse is being ridden and moved at least 2.5 blocks
execute on controller unless score @s gm4_horse.horse_moved matches 250.. run return fail
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s gm4_horse.experience_to_level 1
execute if score @s gm4_horse.experience_to_level matches ..0 run function gm4_horsemanship:level/level_up
