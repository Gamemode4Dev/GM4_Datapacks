# @s = none
# run from durability/prep_mainhand and durability/prep_offhand

execute as @a[gamemode=!creative,tag=gm4_ef_durability_main] run function gm4_end_fishing:durability/set_mainhand
execute as @a[gamemode=!creative,tag=gm4_ef_durability_off] run function gm4_end_fishing:durability/set_offhand
