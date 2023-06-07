# plays the intro song to all players online during first install of Gamemode 4

execute as @a[tag=gm4_intro_playing] at @s run function gm4:intro_song/play

execute if score $song_playing gm4_intro_song matches 1.. run schedule function gm4:intro_song/main 1t
execute if score $song_playing gm4_intro_song matches 1.. run advancement grant @a only gm4:intro_song/root_display
scoreboard players reset $song_playing gm4_intro_song
