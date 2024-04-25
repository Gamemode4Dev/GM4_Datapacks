# apply regeneration to this totem, or if it already has it pulse a stronger effect
# @s = totem armor_stand
# at @s
# run from armor/modifier/type/totem/activate

execute if entity @s[tag=gm4_ce_totem.regeneration] run effect give @a[distance=..18,gamemode=!spectator] regeneration 10 1 true
execute unless entity @s[tag=gm4_ce_totem.regeneration] run tag @s add gm4_ce_totem.regeneration
# TODO 1.20.5: lost random colors due to MC-270743
particle entity_effect{color:[1.0,1.0,1.0,0.15]} ~ ~1.2 ~ 0.1 0.1 0.1 0.5 24
tp @s ~ ~ ~ ~180 ~
