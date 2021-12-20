# Place tripwire, move 1 block forward, repeat
# @s = player using the crossbow
# at @s align xyz positioned ~0.5 ~ ~0.5, up to 40 blocks in one of the cardinal directions
# run from cables/determine_direction and cables/unspool_string

# place tripwire
setblock ~ ~ ~ minecraft:tripwire destroy
particle dust 1 1 1 1 ~ ~ ~ 0 0 0 1 5 normal
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item

# adjust scoreboards
scoreboard players remove @s gm4_cb_strcount 1
scoreboard players add @s gm4_cb_strplace 1

# kill arrow
execute if score @s gm4_cb_strplace matches 1 run kill @e[type=minecraft:arrow,tag=gm4_cb_arrow,distance=..2,limit=1,sort=nearest]

# place hook if possible
execute if score @s gm4_cb_hookcount matches 1 unless block ^ ^ ^2 #gm4_crossbow_cartridges:string_replaceable positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/place_hook

# recursion
execute unless score @s gm4_cb_strcount matches 0 positioned ^ ^ ^1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable run function gm4_crossbow_cartridges:cables/unspool_string
