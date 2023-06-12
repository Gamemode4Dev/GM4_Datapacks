# Setup all online players
# run from base install function, gm4:load, or first join advancement, gm4:intro_song/play_song

tag @s add gm4_intro_playing
scoreboard players set @s gm4_intro_song -240
scoreboard players set @s gm4_intro_song_t -1

schedule function gm4:intro_song/main 1t
