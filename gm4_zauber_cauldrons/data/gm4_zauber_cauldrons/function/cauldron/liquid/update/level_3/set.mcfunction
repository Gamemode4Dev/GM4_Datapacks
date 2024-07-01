# sets the visual liquid level of a cauldron with custom liquid to 3
# @s = zauber cauldron
# at @s align xyz
# run from cauldron/liquid/update/from_score and cauldron/liquid/update/<level>/item_used/

fill ~ ~ ~ ~ ~ ~ water_cauldron[level=3] replace #minecraft:cauldrons
data modify entity @e[type=item_display,tag=gm4_zc_liquid,dx=0,limit=1] transformation set value [1.984f,0f,0f,0f,0f,1.5f,0f,0f,0f,0f,1.984f,0f,0f,0f,0f,1f]
