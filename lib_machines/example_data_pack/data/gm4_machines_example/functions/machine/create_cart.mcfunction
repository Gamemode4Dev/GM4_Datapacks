# places the ender_hopper_minecart down
# @s = hopper_minecart with the ender_hopper_minecart name
# located at @s
# run from gm4_ender_hoppers:machine/verify_place_cart

# summon new hopper minecart
summon hopper_minecart ~ ~ ~ {Tags:["machine_cart_new"],Passengers:[{id:"minecraft:armor_stand",CustomName:'"machine_cart_display"',Tags:["custom_machine_cart_display","gm4_machine_cart","smithed.entity","smithed.strict"],Invisible:1b,Small:1b,Pose:{Head:[180f,0f,0f],RightArm:[0f,0f,0f]},ArmorItems:[{},{},{},{id:"minecraft:gold_block",Count:1}],DisabledSlots:2039583}]}

# clean up
tag @s add machine_cart_new_save
data modify entity @e[type=hopper_minecart,tag=machine_cart_new,distance=..0.1,limit=1] {} merge from entity @s {}
tag @s remove machine_cart_new_save
data merge entity @e[type=hopper_minecart,tag=machine_cart_new_save,distance=..0.1,limit=1] {CustomName:'{"text":"Custom Machine Cart"}',Tags:["custom_machine_cart","gm4_machine_cart"]}
data merge entity @s {Items:[]}
kill @s
