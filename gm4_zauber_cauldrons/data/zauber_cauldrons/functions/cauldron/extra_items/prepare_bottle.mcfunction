#@s=zauber cauldron with overflow items and bottle(s) inside
#run from use_extra_items
#at allign xyz

#remove one from fullness (bottle to be bottled into)
scoreboard players remove @s gm4_zc_fullness 1
#copy fullness and take mod 3
scoreboard players operation mod_fullness gm4_zc_fullness = @s gm4_zc_fullness
scoreboard players operation mod_fullness gm4_zc_fullness %= modulo gm4_zc_fullness

#catch possessed items if
execute if score mod_fullness gm4_zc_fullness matches 0 run function zauber_cauldrons:cauldron/extra_items/catch_possessed_items

#failed catch
execute if score mod_fullness gm4_zc_fullness matches 1.. at @s run function zauber_cauldrons:cauldron/extra_items/failed_catch_possessed_items
