# loads the liquid level into the blockstate of the cauldron from its liquid level score
# @s = zauber cauldron
# at @s align xyz
# run from cauldron/liquid/inspect

# TEMPORARY, THIS WILL LATER BE SUMMONED BY RECIPES ONLY!
# TODO remove this
execute if score @s gm4_zc_liquid_level matches 1.. unless entity @e[type=item_display,tag=gm4_zc_liquid,dx=0,limit=1] run summon minecraft:item_display ~.5 ~.5781 ~.5 {item:{id:"minecraft:magma_block",Count:1b},item_display:"fixed",interpolation_duration:200,interpolation_start:0,transformation:[1.984f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1.984f,0f,0f,0f,0f,1f],Tags:["gm4_zc_liquid"]}

execute if score @s gm4_zc_liquid_level matches 0 run function gm4_zauber_cauldrons:cauldron/liquid/level/0/set
execute if score @s gm4_zc_liquid_level matches 1 run function gm4_zauber_cauldrons:cauldron/liquid/level/1/set
execute if score @s gm4_zc_liquid_level matches 2 run function gm4_zauber_cauldrons:cauldron/liquid/level/2/set
execute if score @s gm4_zc_liquid_level matches 3 run function gm4_zauber_cauldrons:cauldron/liquid/level/3/set
