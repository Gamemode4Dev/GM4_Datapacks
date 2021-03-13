# @s = hopper_minecart to become ender hopper minecart
# run from ender_eye

summon hopper_minecart ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Ender Hopper Minecart",{"translate":"entity.gm4.ender_hopper_minecart"}]}',Tags:["gm4_ender_hopper","gm4_machine"],Passengers:[{id:"minecraft:armor_stand",Tags:["gm4_ender_hoppers_display"],Invisible:1b,Small:1b,Pose:{Head:[180f,0f,0f]},ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:2,SkullOwner:{Id:[I;1964704555,2145010140,-1605733257,-2064122154],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1ODY3MzMwMzQ2MjcsInByb2ZpbGVJZCI6Ijc1MWIwMzJiN2ZkYTQxZGNhMDRhNzQ3Nzg0ZjdmZWQ2IiwicHJvZmlsZU5hbWUiOiJtaXNvZGUiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTM2NjlhYWMzNDJiNzQ0Nzk1ODk4MGI4ZTcyZGU3ZTlkNmNlODcyMTZlYzFmNTU2MTVlZTMxMDVhM2UxZGU0YSJ9fX0="}]}}}}],DisabledSlots:2039583}]}
particle large_smoke ~ ~0.5 ~ 0.2 0.2 0.2 0 10
playsound minecraft:block.portal.trigger block @a[distance=..5] ~ ~ ~ 0.2
data merge entity @s {Items:[]}
kill @s
kill @e[type=item,tag=gm4_ender_hoppers_checking,limit=1]
