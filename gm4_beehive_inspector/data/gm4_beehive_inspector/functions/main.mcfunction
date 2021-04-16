execute at @a[scores={gm4_beehive_insp=1..}] as @e[type=item,distance=..5,tag=!gm4_beehive_inspector_checked,nbt={Item:{id:"minecraft:beehive",Count:1b}}] at @s run function gm4_beehive_inspector:inspect
scoreboard players reset @a gm4_beehive_insp

schedule function gm4_beehive_inspector:main 1t
