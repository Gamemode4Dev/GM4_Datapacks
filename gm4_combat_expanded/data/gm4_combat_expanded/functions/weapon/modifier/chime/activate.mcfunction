# chime weapon effects
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# get data
scoreboard players operation $chime_damage gm4_ce_data = @s gm4_ce_chime_damage
scoreboard players operation $chime_damage gm4_ce_data > #2 gm4_ce_data

# find tagged target
scoreboard players set $chime_target gm4_ce_data 0
execute anchored eyes positioned ^ ^ ^2.5 as @e[distance=..3.4,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict] run function gm4_combat_expanded:weapon/modifier/chime/check_target

execute if score $chime_target gm4_ce_data matches 0 run function gm4_combat_expanded:weapon/modifier/chime/target_set

# store chime damage back into score
scoreboard players operation @s gm4_ce_chime_damage = $chime_damage gm4_ce_data
