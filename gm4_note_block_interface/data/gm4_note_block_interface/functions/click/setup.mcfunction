# check if player is sneaking and start ray cast to find note block
# @s = player who has punched a note block
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_note_block_interface:click

# resets click scores
scoreboard players reset @s gm4_nbi_click

# sets raycast limit
scoreboard players set @s gm4_nbi_ray 50

# runs raycast loop
execute unless predicate gm4_note_block_interface:sneaking run function gm4_note_block_interface:click/loop
execute if predicate gm4_note_block_interface:sneaking run function gm4_note_block_interface:click/sneak_loop
