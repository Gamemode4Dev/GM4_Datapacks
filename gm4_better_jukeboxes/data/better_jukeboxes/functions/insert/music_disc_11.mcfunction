replaceitem block ~ ~1 ~ container.0 air
setblock ~ ~ ~ jukebox[has_record=true]{RecordItem:{id:"minecraft:music_disc_11",Count:1b}}
stopsound @a[distance=..16] master minecraft:music_disc.11
playsound minecraft:music_disc.11 master @a ~ ~ ~
