# @s = @e[tag=gm4_chairs] and NOT inside stair blocks
#execute at @s align xyz run tp @e[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}},dx=0,dz=0,dy=2] ~ ~.4 ~
tp @s ~ ~.5 ~
execute at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:100,Tags:["gm4_chairs_temp"]}
kill @s
execute at @e[tag=gm4_chairs_temp] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:porkchop"}},distance=..1]
kill @e[tag=gm4_chairs_temp]
