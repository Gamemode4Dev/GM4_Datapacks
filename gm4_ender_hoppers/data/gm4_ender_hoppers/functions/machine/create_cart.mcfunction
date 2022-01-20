# places the ender_hopper_minecart down
# @s = hopper_minecart with the ender_hopper_minecart name
# located at @s
# run from gm4_ender_hoppers:machine/verify_place_cart

# summon new hopper minecart
summon hopper_minecart ~ ~ ~ {Tags:["gm4_ender_hopper_minecart_new","gm4_new_machine"],Passengers:[{id:"minecraft:armor_stand",CustomName:'"gm4_ender_hopper_stand"',Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],Invisible:1b,Small:1b,Pose:{Head:[180f,0f,0f],RightArm:[0f,0f,0f]},ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:3420002,SkullOwner:{Id:[I;1964704555,2145010140,-1605733257,-2064122154],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1ODY3MzMwMzQ2MjcsInByb2ZpbGVJZCI6Ijc1MWIwMzJiN2ZkYTQxZGNhMDRhNzQ3Nzg0ZjdmZWQ2IiwicHJvZmlsZU5hbWUiOiJtaXNvZGUiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTM2NjlhYWMzNDJiNzQ0Nzk1ODk4MGI4ZTcyZGU3ZTlkNmNlODcyMTZlYzFmNTU2MTVlZTMxMDVhM2UxZGU0YSJ9fX0="}]}}}}],DisabledSlots:2039583,HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420009}},{}]}]}
particle large_smoke ~ ~0.5 ~ 0.2 0.2 0.2 0 10
playsound minecraft:block.portal.trigger block @a[distance=..5] ~ ~ ~ 0.2
scoreboard players set @e[tag=gm4_new_machine,distance=..2] gm4_entity_version 1

# clean up
data modify entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {} merge from entity @s {}
data merge entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Minecart with Ender Hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper_minecart","font":"gm4:container_gui","color":"white"},{"text":"Minecart with Ender Hopper","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.ender_hopper_minecart","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper_minecart","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper_minecart","font":"minecraft:default","color":"#373737"}]]}]}',Tags:["gm4_ender_hopper_minecart","gm4_machine_cart"]}
data merge entity @s {Items:[]}
kill @s
tag @e[distance=..2] remove gm4_new_machine
