# places the ender_hopper_minecart down
# @s = hopper_minecart with the ender_hopper_minecart name
# located at @s
# run from gm4_ender_hoppers:machine/verify_place_cart

# summon new hopper minecart
summon hopper_minecart ~ ~ ~ {Tags:["gm4_ender_hopper_minecart_new","gm4_new_machine"],Passengers:[{id:"minecraft:armor_stand",CustomName:'"gm4_ender_hopper_stand"',Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],Invisible:1b,Small:1b,Pose:{Head:[180f,0f,0f],RightArm:[0f,0f,0f]},ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:3420002,SkullOwner:"$ender_hopper_display"}}],DisabledSlots:2039583,HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420009}},{}]}]}
particle large_smoke ~ ~0.5 ~ 0.2 0.2 0.2 0 10
playsound minecraft:block.respawn_anchor.charge block @a[distance=..5] ~ ~ ~ 0.3 0.7
scoreboard players set @e[tag=gm4_new_machine,distance=..2] gm4_entity_version 1

# clean up
data modify entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {} merge from entity @s {}
data merge entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"},[{"translate":"gui.gm4.ender_hopper_minecart","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart","font":"gm4:default","color":"#404040"}]]}',Tags:["gm4_ender_hopper_minecart","gm4_machine_cart"]}
data merge entity @s {Items:[]}
kill @s
tag @e[distance=..2] remove gm4_new_machine
