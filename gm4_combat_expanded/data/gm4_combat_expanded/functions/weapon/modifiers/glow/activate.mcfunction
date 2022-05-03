# find targets for 'glow'
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# find targets
execute anchored eyes positioned ^ ^ ^2.5 as @e[distance=..2.4,predicate=gm4_combat_expanded:technical/unblocked_hit,tag=!smithed.strict] run function gm4_combat_expanded:weapon/modifiers/glow/glow
