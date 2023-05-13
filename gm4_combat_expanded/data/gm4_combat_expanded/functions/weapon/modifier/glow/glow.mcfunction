# apply glowing and first_strike damage to entities hit
# @s = entity being hit with glow
# at world spawn
# run from weapon/modifier/glow/activate

# if not hit with glow yet activate first strike
execute unless data entity @s ActiveEffects[{Id:24}] run function gm4_combat_expanded:weapon/modifier/glow/first_strike
