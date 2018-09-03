# try to insert a disc if the jukebox doesn't have one and an unpowered hopper above has an item
execute if block ~ ~ ~ jukebox[has_record=false] if block ~ ~1 ~ hopper[enabled=true]{Items:[{Slot:0b}]} run function better_jukeboxes:check_insert
# try to extract a disc if the jukebox has one and an unpowered hopper below is not full
execute if block ~ ~ ~ jukebox[has_record=true] if block ~ ~-1 ~ hopper[enabled=true] unless block ~ ~-1 ~ hopper{Items:[{Slot:0b},{Slot:1b},{Slot:2b},{Slot:3b},{Slot:4b}]} run function better_jukeboxes:check_extract

data merge entity @s {Fire:2000}
execute unless block ~ ~ ~ jukebox run function better_jukeboxes:destroy
