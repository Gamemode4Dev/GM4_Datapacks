#@s = tank with entity below it positioned ~ ~-1 ~
#run from liquid_tanks:process via #gm4_liquid_tanks:util_below

tag @s add gm4_processing_tank

# lightning
execute if score @s[tag=gm4_lt_liab_lightning] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] unless entity @s[predicate=gm4_lightning_in_a_bottle:on_fire] run function gm4_lightning_in_a_bottle:liquid_tanks/util/lightning

tag @s remove gm4_processing_tank
