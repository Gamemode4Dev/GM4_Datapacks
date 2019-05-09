setblock ~ ~ ~ jukebox[has_record=true]
data modify block ~ ~ ~ RecordItem set from block ~ ~1 ~ Items[0]
replaceitem block ~ ~1 ~ container.0 air
stopsound @a[distance=..16] record
playsound minecraft:music_disc.chirp record @a ~ ~ ~
