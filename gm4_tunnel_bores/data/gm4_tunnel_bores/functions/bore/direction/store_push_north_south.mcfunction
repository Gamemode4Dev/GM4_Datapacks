# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:bore/direction/update_direction

# get force values
execute store result score PushZ gm4_bore_data run data get entity @s PushZ

# check force direction (+/-) and store to scoreboard
execute if score PushZ gm4_bore_data matches 1.. run scoreboard players set @s gm4_bore_data 0
execute if score PushZ gm4_bore_data matches ..-1 run scoreboard players set @s gm4_bore_data 180

# keep previous direction, if code couldn't decide on new one and the previous direction alligns with rail beneath
execute if score @s gm4_bore_data matches -1 unless score previous_direction gm4_bore_data matches -1 run function gm4_tunnel_bores:bore/direction/restore_previous_direction
