# Place tripwire, move 1 block forward, repeat
# @s = player using the crossbow
# at end of tripwire line, align xyz positioned ~0.5 ~ ~0.5, up to 40 blocks in one of the cardinal directions
# run from cables/determine_direction and cables/unspool_string

# place tripwire
execute unless block ~ ~ ~ minecraft:tripwire run function gm4_crossbow_cartridges:cables/place_tripwire
particle dust 1 1 1 1 ~ ~ ~ .1 .1 .1 1 5 normal
scoreboard players add @s gm4_cb_tw_length 1

# kill arrow
execute if score @s gm4_cb_tw_length matches 1 run kill @e[tag=gm4_cb_arrow,distance=..2,limit=1,sort=nearest]

# place hook if possible
execute if score @s gm4_cb_tw_hook matches 1 unless block ^ ^ ^2 #gm4_crossbow_cartridges:string_replaceable positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/place_hook

# recursion
execute unless score @s gm4_cb_string matches 0 unless score @s gm4_cb_tw_length matches 40.. positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/unspool_string
