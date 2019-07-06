#@s = tank with entity above it positioned ~ ~-1 ~
#run from liquid_tanks:process via #liquid_tanks:util_below

tag @s add gm4_processing_tank

#harming
execute if score @s[tag=gm4_lt_zauber_harming] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function zauber_liquids:util/harming

#healing
execute if score @s[tag=gm4_lt_zauber_healing] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function zauber_liquids:util/healing

#leaping
execute if score @s[tag=gm4_lt_zauber_leaping] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:8b}]}] run function zauber_liquids:util/leaping

#poison
execute if score @s[tag=gm4_lt_zauber_poison] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:19b}]}] run function zauber_liquids:util/poison

#regeneration
execute if score @s[tag=gm4_lt_zauber_regeneration] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:10b}]}] run function zauber_liquids:util/regeneration

#speed
execute if score @s[tag=gm4_lt_zauber_speed] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:1b}]}] run function zauber_liquids:util/speed

#strength
execute if score @s[tag=gm4_lt_zauber_strength] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:5b}]}] run function zauber_liquids:util/strength

tag @s remove gm4_processing_tank
