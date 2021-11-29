# tests if the player has punched a note block
execute as @a[scores={gm4_nbi_punch=1..}] at @s anchored eyes positioned ^ ^ ^ run function gm4_note_block_interface:punch/setup

schedule function gm4_note_block_interface:tick 1t
