# slow all nearby entities during night
# @s = player being checked
# at @s
# run from armor/check_modifier

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level

# give effect to nearby entities
execute if score $level gm4_ce_data matches 1 run effect give @e[type=!armor_stand,team=!gm4_ce_team_check,distance=0.01..6,tag=!smithed.strict] slowness 1 0
execute if score $level gm4_ce_data matches 2 run effect give @e[type=!armor_stand,team=!gm4_ce_team_check,distance=0.01..6,tag=!smithed.strict] slowness 1 1
execute if score $level gm4_ce_data matches 3 run effect give @e[type=!armor_stand,team=!gm4_ce_team_check,distance=0.01..6,tag=!smithed.strict] slowness 1 2
