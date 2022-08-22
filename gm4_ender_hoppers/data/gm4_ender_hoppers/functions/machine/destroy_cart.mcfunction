# destroys the ender_hopper
# @s = ender_hopper marker
# located at @s
# run from gm4_ender_hoppers:machine/verify_destroy

# kill entities related to machine block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..2,nbt={Age:0s,Item:{id:"minecraft:hopper_minecart",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","text":"Minecart with Ender Hopper"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#373737","font":"minecraft:default","text":"Minecart with Ender Hopper"}],"translate":"gui.gm4.ender_hopper_minecart"}]},{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","translate":"container.gm4.ender_hopper_minecart"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#373737","font":"minecraft:default","translate":"container.gm4.ender_hopper_minecart"}],"translate":"gui.gm4.ender_hopper_minecart"}]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle explosion ~ ~ ~
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~0.4 ~ loot gm4_ender_hoppers:entities/ender_hopper_minecart
