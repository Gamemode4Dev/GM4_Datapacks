# run from main
# @s = online player

# calculate difficulty for newly (re)spawned players
execute if score @s gm4_ai_alivetime matches 1..16 run function gm4_armor_identification:player/calculate_difficulty

# calculate damage taken from guarding
execute if entity @s[tag=gm4_ai_guardian] if score @s gm4_ai_guard matches 10.. run function gm4_armor_identification:armor/modifiers/type/guardian/damage_calc

# translate being hit / killing mobs to timers
execute if score @s gm4_ai_hurt matches 1.. run scoreboard players set @s gm4_ai_t_hurt 5
execute if score @s gm4_ai_kill matches 1.. run scoreboard players set @s gm4_ai_t_kill 5

# remove beacon tag
tag @s[tag=gm4_ai_beacon_active] remove gm4_ai_beacon_active

# process armor
execute if predicate gm4_armor_identification:modified_armor/wearing run function gm4_armor_identification:armor/process_armor

# shield players if they have stored shield
execute if score @s gm4_ai_absorp matches 1.. run function gm4_armor_identification:player/shield_player
# heal players if they have stored health
execute if score @s gm4_ai_healstore matches 1.. run function gm4_armor_identification:player/heal/heal_calc

# timers
execute if score @s gm4_ai_t_hurt matches 1.. run scoreboard players remove @s gm4_ai_t_hurt 1
execute if score @s gm4_ai_t_shield matches 1.. run scoreboard players remove @s gm4_ai_t_shield 1
execute if score @s gm4_ai_t_guard matches 1.. run scoreboard players remove @s gm4_ai_t_guard 1
execute if score @s gm4_ai_t_wolf matches 1.. run scoreboard players remove @s gm4_ai_t_wolf 1
execute if score @s gm4_ai_t_kill matches 1.. run scoreboard players remove @s gm4_ai_t_kill 1
execute if score @s gm4_ai_t_soothe matches 1.. run scoreboard players remove @s gm4_ai_t_soothe 1
execute if score @s gm4_ai_t_witch matches 1.. run scoreboard players remove @s gm4_ai_t_witch 1

# reset scoreboards
scoreboard players reset @s gm4_ai_hurt
scoreboard players reset @s gm4_ai_kill
