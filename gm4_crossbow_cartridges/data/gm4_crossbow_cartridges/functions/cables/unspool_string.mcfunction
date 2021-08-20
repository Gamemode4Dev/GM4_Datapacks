# Place tripwire, move 1 block forward, repeat
# @s = player using the crossbow
# at @s align xyz positioned ~0.5 ~ ~0.5, up to 40 blocks in one of the cardinal directions
# run from cables/determine_direction and cables/unspool_string

# place tripwire
setblock ~ ~ ~ minecraft:tripwire destroy
particle dust 1 1 1 1 ~ ~ ~ 0 0 0 1 5 normal
clear @s[gamemode=!creative] minecraft:string 1

# adjust scoreboards
scoreboard players remove @s gm4_cb_strcount 1
scoreboard players add @s gm4_cb_strplace 1

# kill arrow
execute if score @s gm4_cb_strplace matches 1 run kill @e[type=minecraft:arrow,tag=gm4_cb_arrow,distance=..2,limit=1,sort=nearest]

# 40 block long tripwire advancement
execute if score @s gm4_cb_strplace matches 40 run advancement grant @s only gm4:crossbow_cartridges_string

# recursion
execute positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable unless score @s gm4_cb_strcount matches 0 run function gm4_crossbow_cartridges:cables/unspool_string
