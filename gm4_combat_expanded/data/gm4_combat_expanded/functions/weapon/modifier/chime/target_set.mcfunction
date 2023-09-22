# set chime target
# @s = player wielding the weapon
# at @s
# run from weapon/modifier/chime/activate

execute anchored eyes positioned ^ ^ ^2.5 run data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.last_target set from entity @e[distance=..2.4,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict,limit=1,sort=nearest] UUID
scoreboard players set $chime_damage gm4_ce_data 2
item modify entity @s weapon.mainhand gm4_combat_expanded:update
