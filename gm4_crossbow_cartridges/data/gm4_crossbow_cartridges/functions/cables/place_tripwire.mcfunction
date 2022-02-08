# Place tripwire
# @s = player using the crossbow
# at end of tripwire line, align xyz positioned ~0.5 ~ ~0.5, up to 40 blocks in one of the cardinal directions
# run from cables/unspool_string

# place tripwire
setblock ~ ~ ~ minecraft:tripwire destroy

# remove string from player
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item
scoreboard players remove @s[gamemode=!creative] gm4_cb_string 1
