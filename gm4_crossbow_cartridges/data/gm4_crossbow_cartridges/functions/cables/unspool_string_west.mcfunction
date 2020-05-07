#run from cables/determine_direction
#@s = player using the crossbow

function gm4_crossbow_cartridges:cables/place_string

#recursion
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if score @s gm4_cb_strcount matches 1.. if score @s gm4_cb_strplace matches ..39 run function gm4_crossbow_cartridges:cables/unspool_string_west