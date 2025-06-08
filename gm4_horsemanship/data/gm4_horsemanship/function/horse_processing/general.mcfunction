# process gm4 horses, variants, donkeys and mules
# @s = gm4_horse
# at @s
# run from main

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
execute if score $mounted gm4_horse_data matches 1 on controller if score @s gm4_horse_riding matches 1.. run scoreboard players set $riding gm4_horse_data 1
execute store success score $saddled gm4_horse_data if data entity @s equipment.saddle
execute store success score $on_leash gm4_horse_data if data entity @s leash.UUID

scoreboard players set $training_efficiency gm4_horse_data 100

#execute if score $mounted gm4_horse_data matches 1 run function gm4_horsemanship:horse_processing/mounted
#execute if score $mounted gm4_horse_data matches 0 run function gm4_horsemanship:horse_processing/unmounted


## | Stamina
# cap of 75 - 450 depending on level
# mounted = +1
# unmounted = +3 +level
execute if score $mounted gm4_horse_data matches 1 if score $riding gm4_horse_data matches 0 run scoreboard players add @s gm4_horse_need.stamina 1
execute if score $mounted gm4_horse_data matches 0 run scoreboard players add @s gm4_horse_need.stamina 3
execute if score $mounted gm4_horse_data matches 0 run scoreboard players operation @s gm4_horse_need.stamina += @s gm4_horse_level
scoreboard players operation @s gm4_horse_need.stamina < @s gm4_horse_need.stamina_cap
# riding = -1
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.stamina=1..}] gm4_horse_need.stamina 1
execute if score @s[tag=!gm4_horse.tired] gm4_horse_need.stamina matches 0 run function gm4_horsemanship:riding/stamina/tired
execute if entity @s[tag=gm4_horse.tired] run particle entity_effect{color:[0.290,0.259,0.090,0.75]} ~ ~1 ~ 0.5 0.5 0.5 1 4 normal
execute if score @s[tag=gm4_horse.tired] gm4_horse_need.stamina matches 30.. run function gm4_horsemanship:riding/stamina/rested

## | Grazing
# cap of 1800
# grazed = +360, or set to 1800 if on Hay Bale
# if score >300 force grazing if not riding, or >1500 if on Hay Bale
execute if score @s[tag=!gm4_horse.force_graze] gm4_horse_need.graze matches ..300 if score $riding gm4_horse_data matches 0 if block ~ ~-1 ~ grass_block if block ~ ~ ~ #gm4_horsemanship:can_eat_through run function gm4_horsemanship:need/graze/force
execute if score @s[tag=!gm4_horse.force_graze] gm4_horse_need.graze matches ..1500 if score $riding gm4_horse_data matches 0 if block ~ ~-1 ~ hay_block if block ~ ~ ~ #gm4_horsemanship:can_eat_through run function gm4_horsemanship:need/graze/force
execute if score $riding gm4_horse_data matches 1 if entity @s[nbt={EatingHaystack:1b}] run function gm4_horsemanship:need/graze/cancel
# always = -1
# riding = -2
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.graze=2..}] gm4_horse_need.graze 2
scoreboard players remove @s[scores={gm4_horse_need.graze=1..}] gm4_horse_need.graze 1
execute if score @s gm4_horse_need.graze matches ..300 run particle entity_effect{color:[0.345,0.463,0.325,0.75]} ~ ~1 ~ 0.5 0.5 0.5 1 4 normal

## | Care
# cap of 5625
# brushed = +2000 (only when dirty)
# near another horse = +2
# on leash to an entity = +5
execute if entity @e[type=#gm4_horsemanship:trainable,distance=0.01..24] run scoreboard players add @s gm4_horse_need.care 2
execute if score $mounted gm4_horse_data matches 0 if score $on_leash gm4_horse_data matches 1 run scoreboard players add @s gm4_horse_need.care 5
# always = -1
# riding = -4
# graze at 0 = -15
# dirty = -10
# unmounted but saddled = -2
scoreboard players remove @s[scores={gm4_horse_need.care=1..}] gm4_horse_need.care 1
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.care=4..}] gm4_horse_need.care 4
execute if score $mounted gm4_horse_data matches 0 unless score @s gm4_horse_need.brushing matches 1.. run scoreboard players remove @s gm4_horse_need.care 10
execute if score @s gm4_horse_need.graze matches 0 run scoreboard players remove @s gm4_horse_need.care 15
execute if score $mounted gm4_horse_data matches 0 if score $saddled gm4_horse_data matches 1 run scoreboard players remove @s gm4_horse_need.care 2
scoreboard players operation @s gm4_horse_need.care > #0 gm4_horse_data
# > Brushing
# cap of 750
# brushed = +10 per tick (from advancement, only if brushing is 740 or less)
# saddled = -1
# riding = -1
execute if score $saddled gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.brushing=1..}] gm4_horse_need.brushing 1
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.brushing=1..}] gm4_horse_need.brushing 1
execute unless score @s gm4_horse_need.brushing matches 50.. run particle block{block_state:"dirt"} ~ ~1 ~ 0.4 0.3 0.4 0 1
 

## | Training
execute if score $riding gm4_horse_data matches 1 run scoreboard players add @s gm4_horse_riding 1
execute if score $riding gm4_horse_data matches 0 run scoreboard players reset @s[scores={gm4_horse_riding=1..}] gm4_horse_riding
execute if score @s gm4_horse_riding matches 5.. run scoreboard players remove @s[tag=!gm4_horse.tired,scores={gm4_horse_level=..14}] gm4_horse_experience 1
scoreboard players reset @s[scores={gm4_horse_riding=5..}] gm4_horse_riding
execute if score @s[scores={gm4_horse_level=..14}] gm4_horse_experience matches ..0 run function gm4_horsemanship:level/level_up
