# tests if the player has played a note block
execute as @a[scores={gm4_nbi_play=1..}] at @s anchored eyes positioned ^ ^ ^ run function gm4_note_block_interface:play/setup

schedule function gm4_note_block_interface:tick 1t
