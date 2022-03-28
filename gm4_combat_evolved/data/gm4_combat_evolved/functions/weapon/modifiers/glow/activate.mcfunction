# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

# find targets
execute anchored eyes positioned ^ ^ ^2.5 as @e[distance=..2.4,predicate=gm4_combat_evolved:technical/unblocked_hit,tag=!smithed.strict] run function gm4_combat_evolved:weapon/modifiers/glow/glow
