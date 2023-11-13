# removes the custom liquid from a cauldron
# @s = zauber cauldron
# at @s align xyz
# run from cauldron/liquid/level_update and cauldron/liquid/update/<level>/item_used/

fill ~ ~ ~ ~ ~ ~ cauldron replace #minecraft:cauldrons
scoreboard players reset @s gm4_zc_liquid_level

# kill display and remove liquid id from cauldron
kill @e[type=item_display,tag=gm4_zc_liquid,dx=0,limit=1]
data modify entity @s data.gm4_zauber_cauldrons.liquid set value "none"
