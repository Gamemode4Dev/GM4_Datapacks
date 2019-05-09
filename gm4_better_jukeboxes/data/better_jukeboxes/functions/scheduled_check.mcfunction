# extract a disc if the jukebox has a disc and an unpowered hopper below is not full
execute as @e[type=armor_stand,tag=gm4_better_jukebox] at @s positioned ~ ~0.45 ~ if block ~ ~ ~ jukebox[has_record=true]{RecordItem:{}} if block ~ ~-1 ~ hopper[enabled=true] unless block ~ ~-1 ~ hopper{Items:[{Slot:0b},{Slot:1b},{Slot:2b},{Slot:3b},{Slot:4b}]} run function better_jukeboxes:check_extract
