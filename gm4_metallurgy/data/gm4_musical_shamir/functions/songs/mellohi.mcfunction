#@s = players holding musical with gm4_note_collect=4..
#at @s
#run from musical_shamir:main

#start song timer
scoreboard players add @s gm4_note_time 1

#start song
execute if score @s gm4_note_time matches 1 run playsound minecraft:music_disc.mellohi player @s ~ 10000 ~ 300000000 2

#effects
execute if score @s gm4_note_time matches 1 run effect give @s slowness 48 0
execute if score @s gm4_note_time matches 1 run effect give @s strength 48 0

#particles
particle note ~ ~1 ~ 1.4 1.4 1.4 .5 12 normal @a[distance=..8]

#song end
execute if score @s gm4_note_time matches 60.. run function gm4_musical_shamir:songs/mellohi_end
