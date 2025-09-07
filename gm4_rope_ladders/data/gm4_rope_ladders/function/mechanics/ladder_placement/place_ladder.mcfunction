# places a ladder when the scan finds a valid location
# @s = player that interacts with a rcd interaction while holding ladder
# at location of valid spot for ladder placement
# run from function: gm4_rope_ladders:mechanics/ladder_placement/scan_column/loop

# set scorebaord
scoreboard players set $ladder_placed gm4_rol_data 1

# remove 1 ladder from players hand
execute store success score $mainhand gm4_rol_data if items entity @s weapon.mainhand ladder
execute if score $mainhand gm4_rol_data matches 1 run item modify entity @s[gamemode=!creative] weapon.mainhand {"function": "minecraft:set_count","count": -1,"add": true}
execute if score $mainhand gm4_rol_data matches 0 run item modify entity @s[gamemode=!creative] weapon.offhand {"function": "minecraft:set_count","count": -1,"add": true}

# grant advancement
advancement grant @s only gm4:rope_ladders

# break block
execute unless block ~ ~ ~ #gm4:water run setblock ~ ~ ~ air destroy
execute if block ~ ~ ~ #gm4:water run setblock ~ ~ ~ water destroy

# place ladder
execute unless block ~ ~ ~ #gm4:water run clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~
execute if block ~ ~ ~ #gm4:water run function gm4_rope_ladders:mechanics/ladder_placement/place_water_ladder
