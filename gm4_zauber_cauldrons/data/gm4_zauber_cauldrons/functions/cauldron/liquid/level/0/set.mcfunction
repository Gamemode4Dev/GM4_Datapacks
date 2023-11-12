# removes the custom liquid from a cauldron
# @s = zauber cauldron
# at @s align xyz
# run from cauldron/liquid/level_update and cauldron/liquid/level/<level>/item_used/

fill ~ ~ ~ ~ ~ ~ cauldron replace #minecraft:cauldrons
scoreboard players reset @s gm4_zc_liquid_level
kill @e[type=item_display,tag=gm4_zc_liquid,dx=0,limit=1]
