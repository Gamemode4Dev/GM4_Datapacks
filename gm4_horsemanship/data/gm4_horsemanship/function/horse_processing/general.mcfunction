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

# give horses in love a speed boost (slow horses may fail to breed)
execute store result score $in_love gm4_horse_data run data get entity @s InLove
execute if score $in_love gm4_horse_data matches 1.. if score $mounted gm4_horse_data matches 0 run effect give @s speed 1 4 true

# wearing glider
execute if items entity @s[tag=!gm4_horse.glider_disabled] armor.body *[custom_data~{gm4_horsemanship:{glider:{}}}] run function gm4_horsemanship:horse_processing/glider/process

## | Stamina
# cap of 75 - 450 depending on level
# riding = -1
# swimming = -1
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse.stamina=1..}] gm4_horse.stamina 1
execute if entity @s[tag=gm4_horse.swimming] run scoreboard players remove @s[scores={gm4_horse.stamina=1..}] gm4_horse.stamina 1
# mounted = +1
# unmounted = +1 +level
execute if score $on_ground gm4_horse_data matches 1 if score $riding gm4_horse_data matches 0 run scoreboard players add @s gm4_horse.stamina 1
execute if score $on_ground gm4_horse_data matches 1 if score $mounted gm4_horse_data matches 0 run scoreboard players operation @s gm4_horse.stamina += @s gm4_horse.level
scoreboard players operation @s gm4_horse.stamina < @s gm4_horse.stamina_cap
# tired
execute if score @s[tag=!gm4_horse.tired] gm4_horse.stamina matches 0 run function gm4_horsemanship:horse_processing/stamina/tired
execute if score @s[tag=gm4_horse.tired] gm4_horse.stamina matches 30.. run function gm4_horsemanship:horse_processing/stamina/rested
# effects
execute if entity @s[tag=gm4_horse.tired] run particle entity_effect{color:[0.290,0.259,0.090,0.75]} ~ ~1 ~ 0.5 0.5 0.5 1 4 normal
scoreboard players add $sfx_clock gm4_horse_data 1
execute if score $sfx_clock gm4_horse_data matches 3.. run scoreboard players set $sfx_clock gm4_horse_data 0
execute if score $sfx_clock gm4_horse_data matches 0 if score @s gm4_horse.stamina matches 0 run playsound entity.horse.breathe neutral @a ~ ~ ~ 1 0.95
execute if score $sfx_clock gm4_horse_data matches 1 if score @s gm4_horse.stamina matches ..15 run playsound entity.horse.breathe neutral @a ~ ~ ~ 1 0.95
execute if score $sfx_clock gm4_horse_data matches 2 if score @s gm4_horse.stamina matches ..30 run playsound entity.horse.breathe neutral @a ~ ~ ~ 1 0.95

# stop grazing if horse is being ridden
execute if score $riding gm4_horse_data matches 1 if entity @s[nbt={EatingHaystack:1b}] run function gm4_horsemanship:horse_processing/graze/cancel

# reduce experience to next level as horse is being ridden
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[tag=!gm4_horse.tired] gm4_horse.experience_to_level 1
execute if score @s[tag=!gm4_horse.tired] gm4_horse.experience_to_level matches ..0 run function gm4_horsemanship:level/level_up
