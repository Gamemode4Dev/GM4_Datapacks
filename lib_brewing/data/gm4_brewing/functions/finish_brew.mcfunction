# @s = none
# run from prep_finish_brew

# finalize potions
execute as @e[type=marker,tag=gm4_brewing_finished] at @s run function gm4_brewing:finalize_potions/get_brewing_stand
