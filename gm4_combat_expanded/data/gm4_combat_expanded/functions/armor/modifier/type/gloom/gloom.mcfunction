# slow all nearby entities during night
# @s = player being checked
# at @s
# run from armor/check_modifier/night

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# give effect to nearby entities
execute if score $level gm4_ce_data matches 1 run effect give @e[type=!#gm4_combat_expanded:effect_immune,type=!player,team=!gm4_ce_team_check,distance=0.01..12,tag=!smithed.strict] slowness 2 0
execute if score $level gm4_ce_data matches 2 run effect give @e[type=!#gm4_combat_expanded:effect_immune,type=!player,team=!gm4_ce_team_check,distance=0.01..12,tag=!smithed.strict] slowness 2 1
execute if score $level gm4_ce_data matches 3 run effect give @e[type=!#gm4_combat_expanded:effect_immune,type=!player,team=!gm4_ce_team_check,distance=0.01..12,tag=!smithed.strict] slowness 2 2

# give effect to nearby players
execute if score $level gm4_ce_data matches 1 run effect give @a[distance=0.01..6] slowness 2 0
execute if score $level gm4_ce_data matches 2 run effect give @a[distance=0.01..6] slowness 2 1
execute if score $level gm4_ce_data matches 3 run effect give @a[distance=0.01..6] slowness 2 2
