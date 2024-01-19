# apply poison to entities hit
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# get item level x2
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level 2

execute anchored eyes positioned ^ ^ ^3 as @e[distance=..5,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_poison] run function gm4_combat_expanded:weapon/modifier/pierce/apply
