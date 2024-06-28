# stop regen when player gets damaged by something other than a fall
# @s = damaged player
# at @s
# run from advancement gm4_combat_expanded:damaged/damaged

# check what type of damage was inflicted
execute store success score $combat_damage gm4_ce_data unless entity @s[advancements={gm4_combat_expanded:damaged/damaged={combat_damage=false,armor_piercing_combat_damage=false}}]
execute store success score $armor_piercing gm4_ce_data unless entity @s[advancements={gm4_combat_expanded:damaged/damaged={armor_piercing=false,armor_piercing_combat_damage=false}}]

# armor damage
execute if score @s gm4_ce_damage_resisted matches 1.. run function gm4_combat_expanded:player/health/calculate_reduction
scoreboard players set @s gm4_ce_armor_reduction_timer 5

# combat damage regens half a heart every 60 seconds
execute if score $combat_damage gm4_ce_data matches 1 run scoreboard players set @s gm4_ce_combat_regen_timer 75

# out-of-combat damage regenerates rapidly (every 1.6 seconds)
scoreboard players operation @s gm4_ce_damage_taken += @s gm4_ce_damage_absorbed
scoreboard players operation @s gm4_ce_damage_taken += $health_change gm4_ce_data
execute if score $combat_damage gm4_ce_data matches 0 run scoreboard players operation @s gm4_ce_fast_regen_health += @s gm4_ce_damage_taken
scoreboard players reset @s gm4_ce_damage_taken
scoreboard players reset @s gm4_ce_damage_absorbed
scoreboard players set @s gm4_ce_fast_regen_timer 3

# revoke advancement
advancement revoke @s only gm4_combat_expanded:damaged/damaged
scoreboard players reset @s gm4_ce_damage_resisted
