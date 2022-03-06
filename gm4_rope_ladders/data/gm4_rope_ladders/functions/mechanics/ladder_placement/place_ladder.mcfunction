# places a ladder when the scan finds a valid location
# @s = player that interacts with a "right click detection" villager while holding ladder
# at location of valid spot for ladder placement
# run from function: gm4_rope_ladders:mechanics/ladder_placement/scan_column/found

# set scorebaord
scoreboard players set $ladder_placed gm4_rol_data 1

# remove 1 ladder from players hand
item modify entity @s weapon.mainhand gm4_rope_ladders:minus_one

# grant advancement
advancement grant @s only gm4:rope_ladders

# place ladder
clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~
