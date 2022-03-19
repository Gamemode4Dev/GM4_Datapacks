# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

# find targets
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.4,team=!gm4_invalid,type=!armor_stand,nbt={HurtTime:10s}] run function gm4_combat_evolved:weapon/modifiers/glow/glow
