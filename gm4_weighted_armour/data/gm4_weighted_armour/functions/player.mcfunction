# reduces player movement speed via attribute, with high armor value
# @s = as @a
# at world spawn

attribute @s minecraft:generic.movement_speed modifier remove f20be362-5b66-437b-b802-87963f01af45

scoreboard players set @s gm4_armor_weight 0
scoreboard players set @s[scores={gm4_armor=8..15}] gm4_armor_weight 1
scoreboard players set @s[scores={gm4_armor=16..19}] gm4_armor_weight 2
scoreboard players set @s[scores={gm4_armor=20..}] gm4_armor_weight 3

# allow other modules to modify weight
function #gm4_weighted_armour:weight_modifiers

# allow other modules to apply effects depending on weight
function #gm4_weighted_armour:weight_effects

attribute @s[scores={gm4_armor_weight=1}] minecraft:generic.movement_speed modifier add f20be362-5b66-437b-b802-87963f01af45 gm4_wa_slowness -0.15 multiply
attribute @s[scores={gm4_armor_weight=2}] minecraft:generic.movement_speed modifier add f20be362-5b66-437b-b802-87963f01af45 gm4_wa_slowness -0.3 multiply
attribute @s[scores={gm4_armor_weight=3}] minecraft:generic.movement_speed modifier add f20be362-5b66-437b-b802-87963f01af45 gm4_wa_slowness -0.45 multiply
