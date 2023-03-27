# destroys the tunnel_bore
# @s = tunnel_bore marker
# located at @s
# run from gm4_tunnel_bores:machine/verify_destroy

tag @s add gm4_destroyed_bore_storage

# drop item
scoreboard players set $dropped_item gm4_machine_data 0
execute as @e[type=item,distance=..3,nbt={Age:0s,Item:{id:"minecraft:furnace_minecart",Count:1b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}},limit=1,sort=nearest] at @s run function gm4_tunnel_bores:machine/destroy_cart/drop_item

# scan hoppers if no item was broken
execute if score $dropped_item gm4_machine_data matches 0 run function gm4_tunnel_bores:machine/destroy_cart/scan_hoppers

# kill marker
kill @s
