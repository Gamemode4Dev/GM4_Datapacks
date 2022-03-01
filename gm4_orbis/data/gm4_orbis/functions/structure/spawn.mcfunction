setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:0,mode:"LOAD",posY:0,posZ:0,showair:0b,showboundingbox:0b}
data modify block ~ ~ ~ {} merge from entity @s Item.tag.gm4_orbis.structure
setblock ~ ~1 ~ redstone_block
function #gm4_orbis:structure/post_spawn

scoreboard players add structure_count gm4_orbis_config 1

kill @e[tag=gm4_orbis_structure_pos]
summon marker ~ ~ ~ {CustomName:'"gm4_orbis_structure_pos"',Tags:[gm4_orbis_structure_pos]}
execute store result score #temp_x gm4_count run data get entity @e[tag=gm4_orbis_structure_pos,limit=1] Pos[0]
execute store result score #temp_y gm4_count run data get entity @e[tag=gm4_orbis_structure_pos,limit=1] Pos[1]
execute store result score #temp_z gm4_count run data get entity @e[tag=gm4_orbis_structure_pos,limit=1] Pos[2]
tellraw @a[tag=gm4_orbis_structure_debug] [{"text":"Spawned ","color":"green"},{"nbt":"Item.tag.gm4_orbis.name","entity":"@s"}," at ",{"score":{"objective":"gm4_count","name":"#temp_x"},"color":"gold"}," ",{"score":{"objective":"gm4_count","name":"#temp_y"},"color":"gold"}," ",{"score":{"objective":"gm4_count","name":"#temp_z"},"color":"gold"}]
kill @e[type=marker,tag=gm4_orbis_structure_pos]
