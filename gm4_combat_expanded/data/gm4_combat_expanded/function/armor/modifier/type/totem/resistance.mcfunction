# apply resistance to this totem, or if it already has it pulse a stronger effect
# @s = totem armor_stand
# at @s
# run from armor/modifier/type/totem/activate

execute if entity @s[tag=gm4_ce_totem.resistance] run effect give @a[distance=..18,gamemode=!spectator] resistance 10 1 true
execute unless entity @s[tag=gm4_ce_totem.resistance] run tag @s add gm4_ce_totem.resistance
particle entity_effect{color:[0.56,0.27,0.93,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.5 24
tp @s ~ ~ ~ ~180 ~
