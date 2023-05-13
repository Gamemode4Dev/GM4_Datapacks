# detect saddle item on a stairs and spawn chair
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:saddle"}},tag=!gm4_chairs_ignore] at @s if block ~ ~ ~ #minecraft:stairs[half=bottom] align xyz positioned ~.5 ~ ~.5 unless entity @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4] run function gm4_chairs:create_chair

# kill pig (saddle) if stairs broken
execute as @e[type=minecraft:pig,tag=gm4_chairs,tag=!smithed.entity] run function gm4_chairs:upgrade_path/smithed_compat
execute as @e[type=minecraft:pig,tag=gm4_chairs] at @s unless block ~ ~1 ~ #minecraft:stairs positioned ~ ~.5 ~ run function gm4_chairs:kill

schedule function gm4_chairs:main 16t
