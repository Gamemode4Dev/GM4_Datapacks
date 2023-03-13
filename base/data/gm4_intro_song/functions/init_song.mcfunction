# Setup all online players
# run from function tag, gm4_intro_song:play_online

tag @a add gm4_intro_playing
scoreboard players set @a gm4_intro_song -240
scoreboard players set @a gm4_intro_song_t -1

function gm4_intro_song:main
