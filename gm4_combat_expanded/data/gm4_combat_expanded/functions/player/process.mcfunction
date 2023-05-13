# process player
# @s = online player
# at world spawn
# run from player/submain

# calculate difficulty for newly (re)spawned players
execute if score @s gm4_ce_alivetime matches 1..16 run function gm4_combat_expanded:player/calculate_difficulty

# calculate damage taken from guarding
execute if entity @s[tag=gm4_ce_guardian,scores={gm4_ce_guard=10..}] run function gm4_combat_expanded:armor/modifier/type/guardian/damage_calc

# translate being hit / killing mobs to timers
# translate hurt2 score to count absorbed damage as well
scoreboard players operation @s gm4_ce_hurt += @s gm4_ce_hurt2
scoreboard players set @s[scores={gm4_ce_hurt=1..}] gm4_ce_t_hurt 5
scoreboard players set @s[scores={gm4_ce_kill=1..}] gm4_ce_t_kill 5

# remove husk sprint score if player didn't sprint
execute if score @s gm4_ce_t_sprinting matches 1.. unless score @s gm4_ce_sprinting matches 1.. run scoreboard players reset @s gm4_ce_t_sprinting

# remove tags
tag @s remove gm4_ce_beacon_active
execute if entity @s[tag=gm4_ce_immune_active] run function gm4_combat_expanded:armor/modifier/type/immune/clear_immunities

# process armor
execute if predicate gm4_combat_expanded:modified_armor/wearing run function gm4_combat_expanded:armor/process

# shield players if they have stored shield
execute if score @s gm4_ce_absorp matches 1.. run function gm4_combat_expanded:player/shield_player
# heal players if they have stored health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/heal/heal_calc

## compatability with older versions, can be removed later
attribute @s[tag=gm4_ce_weak] generic.attack_speed modifier remove 6f512c49-960b-4792-91d3-1f8c73b252ac
tag @s remove gm4_ce_weak
