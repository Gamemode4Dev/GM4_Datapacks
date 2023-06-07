# destroys the ender_hopper
# @s = ender_hopper marker
# located at @s
# run from gm4_ender_hoppers:machine/verify_destroy

# drop item
scoreboard players set $dropped_item gm4_machine_data 0
execute as @e[type=item,distance=..3,nbt={Age:0s,Item:{id:"minecraft:hopper_minecart",Count:1b,tag:{display:{}}}},limit=1,sort=nearest] at @s run function gm4_ender_hoppers:machine/destroy_cart/drop_item

# scan hoppers if no item was broken
execute if score $dropped_item gm4_machine_data matches 0 run function gm4_ender_hoppers:machine/destroy_cart/scan_hoppers

# kill marker
kill @s
