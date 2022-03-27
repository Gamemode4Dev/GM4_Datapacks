# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

# find targets
execute anchored eyes positioned ^ ^ ^2.5 as @e[distance=..2.4,team=!gm4_invalid,type=!armor_stand,nbt={HurtTime:10s},tag=!smithed.strict] run function gm4_combat_evolved:weapon/modifiers/glow/glow
