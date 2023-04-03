# TODO

data modify storage gm4_hydromancy:temp check_UUID set from storage gm4_hydromancy:temp UUID
execute store success score $owner_found gm4_hy_data run data modify storage gm4_hydromancy:temp check_UUID set from entity @s UUID
execute if score $owner_found gm4_hy_data matches 0 run scoreboard players operation @e[type=trident,tag=gm4_hy_target] gm4_hy_id = @s gm4_hy_id
