#@s = tank with entity above it positioned ~ ~-1 ~
#run from liquid_tanks:process via #liquid_tanks:util_below

tag @s add gm4_processing_tank

#night_vision
execute if score @s[tag=gm4_lt_night_vision] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:16b}]}] run function potion_liquids:util/night_vision

#invisibility
execute if score @s[tag=gm4_lt_invisibility] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:14b}]}] run function potion_liquids:util/invisibility

#leaping
execute if score @s[tag=gm4_lt_leaping] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:8b}]}] run function potion_liquids:util/leaping

#strong_leaping
execute if score @s[tag=gm4_lt_strong_leaping] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:8b,Amplifier:1b}]}] run function potion_liquids:util/strong_leaping

#fire_resistance
execute if score @s[tag=gm4_lt_fire_resistance] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:12b}]}] run function potion_liquids:util/fire_resistance

#swiftness
execute if score @s[tag=gm4_lt_swiftness] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:1b}]}] run function potion_liquids:util/swiftness

#strong_swiftness
execute if score @s[tag=gm4_lt_strong_swiftness] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:1b,Amplifier:1b}]}] run function potion_liquids:util/strong_swiftness

#slowness
execute if score @s[tag=gm4_lt_slowness] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:2b}]}] run function potion_liquids:util/slowness

#strong_slowness
execute if score @s[tag=gm4_lt_strong_slowness] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:2b,Amplifier:1b}]}] run function potion_liquids:util/strong_slowness

#turtle_master
execute if score @s[tag=gm4_lt_turtle_master] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:2b,Amplifier:3b},{Id:11b,Amplifier:2b}]}] run function potion_liquids:util/turtle_master

#strong_turtle_master
execute if score @s[tag=gm4_lt_strong_turtle_master] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:2b,Amplifier:5b},{Id:11b,Amplifier:3b}]}] run function potion_liquids:util/strong_turtle_master

#water_breathing
execute if score @s[tag=gm4_lt_water_breathing] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:13b}]}] run function potion_liquids:util/water_breathing

#healing
execute if score @s[tag=gm4_lt_healing] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function potion_liquids:util/healing

#strong healing
execute if score @s[tag=gm4_lt_strong_healing] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function potion_liquids:util/strong_healing

#harming
execute if score @s[tag=gm4_lt_harming] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function potion_liquids:util/harming

#strong harming
execute if score @s[tag=gm4_lt_strong_harming] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function potion_liquids:util/strong_harming

#poison
execute if score @s[tag=gm4_lt_poison] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:19b}]}] run function potion_liquids:util/poison

#strong poison
execute if score @s[tag=gm4_lt_strong_poison] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:19b,Amplifier:1b}]}] run function potion_liquids:util/strong_poison

#regeneration
execute if score @s[tag=gm4_lt_regeneration] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:10b}]}] run function potion_liquids:util/regeneration

#strong regeneration
execute if score @s[tag=gm4_lt_strong_regeneration] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:10b,Amplifier:1b}]}] run function potion_liquids:util/strong_regeneration

#strength
execute if score @s[tag=gm4_lt_strength] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:5b}]}] run function potion_liquids:util/strength

#strong strength
execute if score @s[tag=gm4_lt_strong_strength] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:5b,Amplifier:1b}]}] run function potion_liquids:util/strong_strength

#weakness
execute if score @s[tag=gm4_lt_weakness] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:18b}]}] run function potion_liquids:util/weakness

#luck
execute if score @s[tag=gm4_lt_luck] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:26b}]}] run function potion_liquids:util/luck

#slow falling
execute if score @s[tag=gm4_lt_slow_falling] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:28b}]}] run function potion_liquids:util/slow_falling

#floating
execute if score @s[tag=gm4_lt_floating] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:25b}]}] run function potion_liquids:util/floating

tag @s remove gm4_processing_tank
