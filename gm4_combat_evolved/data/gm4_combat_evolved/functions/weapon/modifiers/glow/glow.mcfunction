# run from weapon/modifiers/glow/activate
# @s = entity being hit with glow

# if not hit with glow yet activate first strike
execute unless data entity @s ActiveEffects[{Id:24b}] run function gm4_combat_evolved:weapon/modifiers/glow/first_strike

# give glow effect
effect give @s glowing 30 0 true