# check if player is sneaking and start ray cast to find note block
# @s = player tuning note block
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_note_block_interface:tune

# resets tune scores
scoreboard players reset @s gm4_nbi_tune

# sets raycast limit
scoreboard players set @s gm4_nbi_ray 50

# runs raycast loop
execute unless predicate gm4_note_block_interface:sneaking run function gm4_note_block_interface:tune/loop
execute if predicate gm4_note_block_interface:sneaking run function gm4_note_block_interface:tune/sneak_loop
