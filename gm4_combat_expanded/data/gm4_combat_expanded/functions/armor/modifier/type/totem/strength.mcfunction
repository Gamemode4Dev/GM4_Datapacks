# apply strength to this totem, or if it already has it pulse a stronger effect
# @s = totem armor_stand
# at @s
# run from armor/modifier/type/totem/activate

execute if entity @s[tag=gm4_ce_totem.strength] run effect give @a[distance=..12,gamemode=!spectator] strength 4 1 true
execute unless entity @s[tag=gm4_ce_totem.strength] run tag @s add gm4_ce_totem.strength
particle minecraft:effect ~ ~1.2 ~ .4 .4 .4 1 32
