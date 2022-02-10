# kills the selected spore. Tries to plant a new shroomite_shroom if possible
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s
# run from gm4_shroomites:spore/track_age

# try to place new sporing shroom if there is mycelium below, unless the global cap has been reached
execute if score $global_shroom_count gm4_shroom_data < #global_shroom_cap gm4_shroom_data if block ~ ~-1 ~ mycelium if block ~ ~ ~ #gm4_shroomites:shroom_replacable unless entity @e[type=marker,tag=gm4_shroomite_shroom,distance=..4.5] run function gm4_shroomites:shroom/create

# kill spore
kill @s
