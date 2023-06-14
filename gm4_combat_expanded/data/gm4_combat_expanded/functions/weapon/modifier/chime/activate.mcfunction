# chime weapon effects
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# find tagged target
scoreboard players set $chime_target gm4_ce_data 0
execute anchored eyes positioned ^ ^ ^2.5 as @e[distance=..2.4,tag=gm4_ce_chimed,predicate=gm4_combat_expanded:technical/unblocked_hit] run function gm4_combat_expanded:weapon/modifier/chime/damage_grow

execute anchored eyes positioned ^ ^ ^2.5 run tag @e[distance=..2.4,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,limit=1,sort=nearest] add gm4_ce_chimed
