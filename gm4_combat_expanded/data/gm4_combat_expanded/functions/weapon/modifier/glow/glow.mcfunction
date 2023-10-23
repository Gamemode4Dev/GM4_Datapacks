# apply glowing and first_strike damage to entities hit
# @s = entity being hit with glow
# at unspecified
# run from weapon/modifier/glow/activate

# if not hit with glow yet activate first strike
execute unless data entity @s active_effects[{id:"minecraft:glowing"}] run function gm4_combat_expanded:weapon/modifier/glow/first_strike
