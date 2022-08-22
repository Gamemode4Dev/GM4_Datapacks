#@s = tank with entity above it positioned ~ ~-1 ~
#run from liquid_tanks:process via #gm4_liquid_tanks:util_below

tag @s add gm4_processing_tank

#harming
execute if score @s[tag=gm4_lt_zauber_harming_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] run function gm4_zauber_liquids:util/harming

#healing
execute if score @s[tag=gm4_lt_zauber_healing_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] run function gm4_zauber_liquids:util/healing

#leaping
execute if score @s[tag=gm4_lt_zauber_leaping_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:8}]}] run function gm4_zauber_liquids:util/leaping

#poison
execute if score @s[tag=gm4_lt_zauber_poison_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:19}]}] run function gm4_zauber_liquids:util/poison

#regeneration
execute if score @s[tag=gm4_lt_zauber_regeneration_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:10}]}] run function gm4_zauber_liquids:util/regeneration

#speed
execute if score @s[tag=gm4_lt_zauber_swiftness_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:1}]}] run function gm4_zauber_liquids:util/swiftness

#strength
execute if score @s[tag=gm4_lt_zauber_strength_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{ActiveEffects:[{Id:5}]}] run function gm4_zauber_liquids:util/strength

#wormhole
execute if score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[tag=!gm4_zl_wormhole_ignore] run function gm4_zauber_liquids:util/wormhole

tag @s remove gm4_processing_tank
