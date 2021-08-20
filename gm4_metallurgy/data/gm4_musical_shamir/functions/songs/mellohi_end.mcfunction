#@s = players holding musical with gm4_note_time=54..
#at @s
#run from musical_shamir:songs/mellohi

#reset players with not enough mob kills
execute if score @s gm4_note_collect matches ..7 run function gm4_musical_shamir:songs/reset_player

#queue 'chirp' for player with enough mob kills
execute if score @s gm4_note_collect matches 8.. run function gm4_musical_shamir:songs/chirp
