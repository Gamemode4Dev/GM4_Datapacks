# Determine direction of tripwire
# @s = player using the crossbow
# at tripwire_hook, align xyz positioned ~0.5 ~ ~0.5
# run from cables/shoot_arrow

# check if player is facing roughly in one of the cardinal directions, unspool string if this is true
execute if entity @s[y_rotation=170..190] rotated 180 0 positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/unspool_string
execute if entity @s[y_rotation=-100..-80] rotated -90 0 positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/unspool_string
execute if entity @s[y_rotation=-10..10] rotated 0 0 positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/unspool_string
execute if entity @s[y_rotation=80..100] rotated 90 0 positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/unspool_string
