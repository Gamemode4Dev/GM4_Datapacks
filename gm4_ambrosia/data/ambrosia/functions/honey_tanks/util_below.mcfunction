# @s = honey liquid tank with entity below
# at @s

# target entity below
tag @s add gm4_processing_tank
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] run function ambrosia:honey_tanks/util_honey
tag @s remove gm4_processing_tank
