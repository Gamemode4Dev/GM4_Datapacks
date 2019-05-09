summon item ~ ~-0.5 ~ {Item:{id:"minecraft:music_disc_strad",Count:1b},Tags:[gm4_better_jukebox_item]}
execute if data block ~ ~ ~ RecordItem.tag run data modify entity @e[type=item,tag=gm4_better_jukebox_item,distance=..0.5,limit=1] Item.tag set from block ~ ~ ~ RecordItem.tag
setblock ~ ~ ~ jukebox[has_record=false]
stopsound @a[distance=..16] record minecraft:music_disc.strad
