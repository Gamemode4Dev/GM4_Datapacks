execute as @a[tag=gm4_intro_playing] at @s run function gm4_intro_song:play

#execute unless score intro_listener gm4_intro_song matches 0 run
execute if score song_playing gm4_intro_song matches 1.. run schedule function gm4_intro_song:main 1t
scoreboard players reset song_playing gm4_intro_song
