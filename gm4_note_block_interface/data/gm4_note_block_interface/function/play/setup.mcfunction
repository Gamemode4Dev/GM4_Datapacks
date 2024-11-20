# start ray to find note block
# @s = player punching note block
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_note_block_interface:tick

# resets play score
scoreboard players reset @s gm4_nbi_play

# sets raycast limit
scoreboard players set @s gm4_nbi_ray 50

# runs raycast loop
function gm4_note_block_interface:play/loop
