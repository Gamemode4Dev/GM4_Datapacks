# try to insert a disc if the jukebox doesn't have a disc and an unpowered hopper above has an item
execute if block ~ ~ ~ jukebox[has_record=false] if block ~ ~1 ~ hopper[enabled=true]{Items:[{Slot:0b}]} run function better_jukeboxes:check_insert

data merge entity @s {Fire:2000}
execute unless block ~ ~ ~ jukebox run function better_jukeboxes:destroy
