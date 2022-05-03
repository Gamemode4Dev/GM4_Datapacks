# process player
# @s = online player
# run from main

# calculate difficulty for newly (re)spawned players
execute if score @s gm4_ce_alivetime matches 1..16 run function gm4_combat_expanded:player/calculate_difficulty

# calculate damage taken from guarding
execute if entity @s[tag=gm4_ce_guardian] if score @s gm4_ce_guard matches 10.. run function gm4_combat_expanded:armor/modifiers/type/guardian/damage_calc

# translate being hit / killing mobs to timers
execute if score @s gm4_ce_hurt matches 1.. run scoreboard players set @s gm4_ce_t_hurt 5
execute if score @s gm4_ce_kill matches 1.. run scoreboard players set @s gm4_ce_t_kill 5

# remove husk sprint score if player didn't sprint
execute if score @s gm4_ce_t_sprinting matches 1.. unless score @s gm4_ce_sprinting matches 1.. run scoreboard players reset @s gm4_ce_t_sprinting

# remove tags
tag @s remove gm4_ce_beacon_active
execute if entity @s[tag=gm4_ce_immune_active] run function gm4_combat_expanded:armor/modifiers/type/immune/clear_immunities

# process armor
execute if predicate gm4_combat_expanded:modified_armor/wearing run function gm4_combat_expanded:armor/process

# shield players if they have stored shield
execute if score @s gm4_ce_absorp matches 1.. run function gm4_combat_expanded:player/shield_player
# heal players if they have stored health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/heal/heal_calc

# timers
execute if score @s gm4_ce_t_hurt matches 1.. run scoreboard players remove @s gm4_ce_t_hurt 1
execute if score @s gm4_ce_t_shield matches 1.. run scoreboard players remove @s gm4_ce_t_shield 1
execute if score @s gm4_ce_t_guard matches 1.. run scoreboard players remove @s gm4_ce_t_guard 1
execute if score @s gm4_ce_t_wolf matches 1.. run scoreboard players remove @s gm4_ce_t_wolf 1
execute if score @s gm4_ce_t_kill matches 1.. run scoreboard players remove @s gm4_ce_t_kill 1
execute if score @s gm4_ce_t_soothe matches 1.. run scoreboard players remove @s gm4_ce_t_soothe 1
execute if score @s gm4_ce_t_witch matches 1.. run scoreboard players remove @s gm4_ce_t_witch 1

# reset scoreboards
scoreboard players reset @s gm4_ce_hurt
scoreboard players reset @s gm4_ce_kill
scoreboard players reset @s gm4_ce_sprinting
