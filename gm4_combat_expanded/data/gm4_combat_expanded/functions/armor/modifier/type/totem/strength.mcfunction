# apply strength to this totem, or if it already has it pulse a stronger effect
# @s = totem armor_stand
# at @s
# run from armor/modifier/type/totem/activate

execute if entity @s[tag=gm4_ce_totem.strength] run effect give @a[distance=..18,gamemode=!spectator] strength 10 1 true
execute unless entity @s[tag=gm4_ce_totem.strength] run tag @s add gm4_ce_totem.strength
particle ambient_entity_effect ~ ~1.2 ~ 0.1 0.1 0.1 0.5 24
tp @s ~ ~ ~ ~180 ~
