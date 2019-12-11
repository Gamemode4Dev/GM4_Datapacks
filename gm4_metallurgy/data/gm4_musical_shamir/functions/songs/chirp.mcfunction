#@s = players holding musical with gm4_note_time=54.. and gm4_note_collect=10..
#at @s
#run from musical_shamir:songs/mellohi_end

#start song
execute if score @s gm4_note_time matches 60 run playsound minecraft:music_disc.chirp player @s ~ 10000 ~ 300000000 2

#effects
execute if score @s gm4_note_time matches 60 run effect give @s speed 91 2
execute if score @s gm4_note_time matches 60 run effect give @s strength 91 2

#particle
particle note ~ ~1 ~ 1.4 1.4 1.4 .5 6 normal @a[distance=..8]

#end song
execute if score @s gm4_note_time matches 174.. run function gm4_musical_shamir:songs/reset_player
