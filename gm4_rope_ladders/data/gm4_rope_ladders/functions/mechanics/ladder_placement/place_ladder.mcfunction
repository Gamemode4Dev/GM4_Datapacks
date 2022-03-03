
# set scorebaord
scoreboard players set $ladder_placed gm4_rol_data 1

# remove 1 ladder from players hand
item modify entity @s weapon.mainhand gm4_rope_ladders:minus_one

# grant advancement
advancement grant @s only gm4:rope_ladders

# place ladder
clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~
