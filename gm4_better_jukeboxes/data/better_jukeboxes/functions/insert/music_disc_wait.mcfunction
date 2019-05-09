replaceitem block ~ ~1 ~ container.0 air
setblock ~ ~ ~ jukebox[has_record=true]{RecordItem:{id:"minecraft:music_disc_wait",Count:1b}}
stopsound @a[distance=..16] record minecraft:music_disc.wait
playsound minecraft:music_disc.wait record @a ~ ~ ~
