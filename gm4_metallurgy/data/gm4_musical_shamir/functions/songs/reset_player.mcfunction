#@s = players holding musical with gm4_note_time=54.. but gm4_note_collect=..9
#at @s
#run from musical_shamir:songs/mellohi_end and  musical_shamir:songs/chirp and metallurgy:main

#clear effect
execute if score @s gm4_note_time matches 1..60 run effect clear @s minecraft:slowness
execute if score @s gm4_note_time matches 1..174 run effect clear @s minecraft:strength
execute if score @s gm4_note_time matches 60..174 run effect clear @s minecraft:speed

#stop sounds if neccessary
execute if score @s gm4_note_time matches 1..60 run stopsound @s player minecraft:music_disc.mellohi
execute if score @s gm4_note_time matches 60..174 run stopsound @s player minecraft:music_disc.chirp

#reset player
scoreboard players reset @s gm4_note_time
scoreboard players reset @s gm4_note_collect
