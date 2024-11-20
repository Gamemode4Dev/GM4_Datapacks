# Scoreboard init, non-standard init so it is here instead of init
scoreboard objectives add gm4_intro_song dummy
scoreboard objectives add gm4_intro_song_t dummy
scoreboard objectives add gm4_intro_walked minecraft.custom:walk_one_cm

# to enable intro song on first join, run
# /scoreboard players set $first_join gm4_intro_song 1
execute unless score $first_join gm4_intro_song matches 0.. run scoreboard players set $first_join gm4_intro_song 0

advancement grant @a only gm4:intro_song/play_song
