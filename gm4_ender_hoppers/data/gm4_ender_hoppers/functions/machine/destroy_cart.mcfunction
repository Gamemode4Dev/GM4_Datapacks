# destroys the ender_hopper
# @s = ender_hopper marker
# located at @s
# run from gm4_ender_hoppers:machine/verify_destroy

# kill entities related to machine block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:minecart",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Minecart with Ender Hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper_minecart","font":"gm4:container_gui","color":"white"},{"text":"Minecart with Ender Hopper","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.ender_hopper_minecart","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper_minecart","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper_minecart","font":"minecraft:default","color":"#373737"}]]}]}'}}}},limit=1,sort=nearest]
execute if score $dropped_item gm4_machine_data matches 1 run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:hopper",Count:1b}},nbt=!{Item:{tag:{display:{}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle explosion ~ ~ ~
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_ender_hoppers:entities/ender_hopper_minecart
