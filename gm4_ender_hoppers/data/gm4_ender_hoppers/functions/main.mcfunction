#tank creation from ender_eye item
execute as @e[type=item,tag=!gm4_ender_hoppers_checked,nbt={Item:{id:"minecraft:ender_eye",Count:1b},OnGround:1b}] at @s run function gm4_ender_hoppers:ender_eye

execute as @e[type=#gm4_ender_hoppers:ender_hopper,tag=gm4_ender_hopper] at @s run function gm4_ender_hoppers:process

# kill display armor stands when the ender hopper minecart was removed
execute as @e[tag=gm4_ender_hoppers_display] at @s positioned ~ ~-0.1 ~ unless entity @e[type=hopper_minecart,tag=gm4_ender_hopper,distance=..0.01] run function gm4_ender_hoppers:destroy

schedule function gm4_ender_hoppers:main 16t
