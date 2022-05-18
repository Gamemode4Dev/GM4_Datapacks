# destroys the tunnel_bore
# @s = tunnel_bore marker
# located at @s
# run from gm4_tunnel_bores:machine/verify_destroy

# kill entities related to machine block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..2,nbt={Age:0s,Item:{id:"minecraft:minecart",Count:1b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 1 run kill @e[type=item,distance=..2,nbt={Age:0s,Item:{id:"minecraft:furnace",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_tunnel_bores:entities/piston_minecart

kill @s
