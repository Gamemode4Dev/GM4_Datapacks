#@s = as @a
#at world spawn

scoreboard players set @s gm4_armor_weight 0
scoreboard players set @s[scores={gm4_armor=8..15}] gm4_armor_weight 1
scoreboard players set @s[scores={gm4_armor=16..19}] gm4_armor_weight 2
scoreboard players set @s[scores={gm4_armor=20..}] gm4_armor_weight 3

# allow other modules to modify weight
function #gm4_weighted_armour:weight_modifiers

# allow other modules to apply effects depending on weight
function #gm4_weighted_armour:weight_effects

effect give @s[scores={gm4_armor_weight=1}] slowness 2 0 true
effect give @s[scores={gm4_armor_weight=2}] slowness 2 1 true
effect give @s[scores={gm4_armor_weight=3}] slowness 2 2 true
