# places a ladder when the scan finds a valid location
# @s = interacted rcd
# at location of valid spot for ladder placement
# run from function: gm4_rope_ladders:mechanics/ladder_placement/scan_column

# set scorebaord
scoreboard players set $ladder_placed gm4_rol_data 1

# break block
execute unless block ~ ~ ~ #gm4:water run setblock ~ ~ ~ air destroy
execute if block ~ ~ ~ #gm4:water run setblock ~ ~ ~ water destroy

# place ladder
execute unless block ~ ~ ~ #gm4:water run clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~
execute if block ~ ~ ~ #gm4:water run function gm4_rope_ladders:mechanics/ladder_placement/place_water_ladder
