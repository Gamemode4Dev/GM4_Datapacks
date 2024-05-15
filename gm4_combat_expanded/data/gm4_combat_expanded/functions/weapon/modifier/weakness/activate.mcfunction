# apply weakness and slowness to entities hit
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# get item levels
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
execute store result score $level2 gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level2

# slow entities hit
tag @s add gm4_ce_self
execute if score $level gm4_ce_data matches 1 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_slowness] slowness 4 0
execute if score $level gm4_ce_data matches 2 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_slowness] slowness 4 1
execute if score $level gm4_ce_data matches 3 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_slowness] slowness 4 2

# additional effect
execute if score $level2 gm4_ce_data matches 1 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_weakness] weakness 4 0
execute if score $level2 gm4_ce_data matches 2 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_blind] blindness 4 0
execute if score $level2 gm4_ce_data matches 3 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_hunger] hunger 4 2
execute if score $level2 gm4_ce_data matches 4 anchored eyes positioned ^ ^ ^3 run effect give @e[distance=..5,tag=!gm4_ce_self,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,tag=!gm4_ce_immune_wither] wither 4 1
tag @s remove gm4_ce_self
