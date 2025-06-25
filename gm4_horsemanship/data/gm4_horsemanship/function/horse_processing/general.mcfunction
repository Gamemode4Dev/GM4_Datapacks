# process gm4 horses, variants, donkeys and mules
# @s = gm4_horse
# at @s
# run from main

# check health for fed horses
execute if entity @s[tag=gm4_horse.check_health] run function gm4_horsemanship:horse_processing/cap_health

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
execute store result score $on_ground gm4_horse_data run data get entity @s OnGround

## | Stamina
# cap of 75 - 450 depending on level
# riding = -1
# swimming = -1
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.stamina=1..}] gm4_horse_need.stamina 1
execute if entity @s[tag=gm4_horse.swimming] run scoreboard players remove @s[scores={gm4_horse_need.stamina=1..}] gm4_horse_need.stamina 1
# mounted = +1
# unmounted = +3 +level
# on leash = +2*level
execute if score $mounted gm4_horse_data matches 1 if score $on_ground gm4_horse_data matches 1 if score $riding gm4_horse_data matches 0 run scoreboard players add @s gm4_horse_need.stamina 1
execute if score $mounted gm4_horse_data matches 0 if score $on_ground gm4_horse_data matches 1 run scoreboard players add @s gm4_horse_need.stamina 3
execute if score $mounted gm4_horse_data matches 0 if score $on_ground gm4_horse_data matches 1 run scoreboard players operation @s gm4_horse_need.stamina += @s gm4_horse_level
execute if score $on_leash gm4_horse_data matches 1 run scoreboard players operation @s gm4_horse_need.stamina += @s gm4_horse_level
execute if score $on_leash gm4_horse_data matches 1 run scoreboard players operation @s gm4_horse_need.stamina += @s gm4_horse_level
scoreboard players operation @s gm4_horse_need.stamina < @s gm4_horse.stamina_cap
# tired
execute if score @s[tag=!gm4_horse.tired] gm4_horse_need.stamina matches 0 run function gm4_horsemanship:riding/stamina/tired
execute if entity @s[tag=gm4_horse.tired] run particle entity_effect{color:[0.290,0.259,0.090,0.75]} ~ ~1 ~ 0.5 0.5 0.5 1 4 normal
execute if score @s[tag=gm4_horse.tired] gm4_horse_need.stamina matches 30.. run function gm4_horsemanship:riding/stamina/rested

## | Grazing
# cap of 1800
# always = -1
# riding = -2
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.graze=2..}] gm4_horse_need.graze 2
scoreboard players remove @s[scores={gm4_horse_need.graze=1..}] gm4_horse_need.graze 1
# grazed = +360, or set to 1800 if on Hay Bale
# if score >300 force grazing if not riding, or >850 if on Hay Bale and unmounted
execute if score $on_ground gm4_horse_data matches 1 if score @s[tag=!gm4_horse.force_graze] gm4_horse_need.graze matches ..300 if score $riding gm4_horse_data matches 0 if block ~ ~-1 ~ grass_block if block ~ ~ ~ #gm4_horsemanship:can_eat_through run function gm4_horsemanship:need/graze/force
execute if score $on_ground gm4_horse_data matches 1 if score @s[tag=!gm4_horse.force_graze] gm4_horse_need.graze matches ..950 if score $mounted gm4_horse_data matches 0 if block ~ ~-1 ~ hay_block if block ~ ~ ~ #gm4_horsemanship:can_eat_through run function gm4_horsemanship:need/graze/force
execute if score $riding gm4_horse_data matches 1 if entity @s[nbt={EatingHaystack:1b}] run function gm4_horsemanship:need/graze/cancel
# hungry
execute if score @s gm4_horse_need.graze matches 0 run particle entity_effect{color:[0.345,0.463,0.325,0.75]} ~ ~1 ~ 0.5 0.5 0.5 1 4 normal

## | Brushing
# cap of 1500
# saddled = -2
# riding = -1
# always = -1
execute if score $saddled gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.brushing=2..}] gm4_horse_need.brushing 2
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.brushing=1..}] gm4_horse_need.brushing 1
scoreboard players remove @s[scores={gm4_horse_need.brushing=1..}] gm4_horse_need.brushing 1
# brushed = +75 per tick (from advancement, only if brushing is 1450 or less)
execute unless score @s gm4_horse_need.brushing matches 100.. run particle block{block_state:"dirt"} ~ ~1 ~ 0.4 0.3 0.4 0 1

## | On Leash
# cap of 1125
# on leash = +75
# not mounted = -1
execute if score $on_leash gm4_horse_data matches 1 run scoreboard players add @s gm4_horse_need.on_leash 75
scoreboard players operation @s gm4_horse_need.on_leash < $need_cap.on_leash gm4_horse_data
execute if score $mounted gm4_horse_data matches 0 run scoreboard players remove @s[scores={gm4_horse_need.on_leash=1..}] gm4_horse_need.on_leash 1

## | Fed Treat
# cap of 15
# fed a treat = set to 15
# always = -1
execute if score $riding gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.fed_treat=1..}] gm4_horse_need.fed_treat 1
execute if score $on_leash gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.fed_treat=1..}] gm4_horse_need.fed_treat 1

## | Comfort
# 0 - 100%
scoreboard players operation @s gm4_horse_comfort = @s gm4_horse_need.graze
scoreboard players operation @s gm4_horse_comfort /= #2 gm4_horse_data
scoreboard players operation @s gm4_horse_comfort < #1000 gm4_horse_data
scoreboard players add @s gm4_horse_comfort 1500
execute store result score $nearby_horses gm4_horse_data if entity @e[type=#gm4_horsemanship:trainable,distance=0.01..24,limit=10]
scoreboard players operation $nearby_horses gm4_horse_data *= #100 gm4_horse_data
scoreboard players operation @s gm4_horse_comfort += $nearby_horses gm4_horse_data
execute if score @s gm4_horse_need.on_leash matches 1.. unless score $on_leash gm4_horse_data matches 1 run scoreboard players add @s gm4_horse_comfort 750
execute if score @s gm4_horse_need.fed_treat matches 1.. run scoreboard players add @s gm4_horse_comfort 750
scoreboard players operation @s gm4_horse_comfort /= #50 gm4_horse_data


## || Potential & Level-Up
# potential goes up when not riding
scoreboard players set $potential_change gm4_horse_data 0
execute if score $riding gm4_horse_data matches 0 unless score @s gm4_horse_potential.total matches 1125.. run scoreboard players set $potential_change gm4_horse_data 1
execute if score $riding gm4_horse_data matches 1 if score @s gm4_horse_potential.total matches 1.. run scoreboard players set $potential_change gm4_horse_data -1

# add comfort to realized potential when total potential goes up
execute if score $potential_change gm4_horse_data matches 1 run scoreboard players operation @s gm4_horse_potential.realized += @s gm4_horse_comfort

# potential loss multiplier is increased by
# brush score below 50 = +1
# horse is tired = +1
# graze score is below 1 = +1
# on leash is below 1000 = +1
scoreboard players set $potential_loss.mult gm4_horse_data 1
execute unless score @s gm4_horse_need.brushing matches 50.. run scoreboard players add $potential_loss.mult gm4_horse_data 1
execute if entity @s[tag=gm4_horse.tired] run scoreboard players add $potential_loss.mult gm4_horse_data 1
execute unless score @s gm4_horse_need.graze matches 1.. run scoreboard players add $potential_loss.mult gm4_horse_data 1
execute unless score @s gm4_horse_need.on_leash matches 1000.. run scoreboard players add $potential_loss.mult gm4_horse_data 1

# horse realized potential goes down 
scoreboard players operation $potential_loss gm4_horse_data = @s gm4_horse_potential.realized
scoreboard players operation $potential_loss gm4_horse_data /= @s gm4_horse_potential.total

# horse realized potential goes down when riding, the base is subtracted from needed experience, then the multiplied amount is subtracted from realized potential
execute if score $potential_change gm4_horse_data matches -1 run scoreboard players operation @s gm4_horse_experience -= $potential_loss gm4_horse_data
scoreboard players operation $potential_loss gm4_horse_data *= $potential_loss.mult gm4_horse_data
execute if score $potential_change gm4_horse_data matches -1 run scoreboard players operation @s gm4_horse_potential.realized -= $potential_loss gm4_horse_data
execute if score @s[scores={gm4_horse_level=..14}] gm4_horse_experience matches ..0 run function gm4_horsemanship:level/level_up

scoreboard players operation @s gm4_horse_potential.total += $potential_change gm4_horse_data
