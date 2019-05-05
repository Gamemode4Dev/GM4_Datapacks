#tests if the player has punched a note block
execute as @a[scores={gm4_nbi_punch=1..}] at @s anchored eyes positioned ^ ^ ^ anchored feet run function note_block_interface:punch/setup
execute as @a[scores={gm4_nbi_click=1..}] at @s anchored eyes positioned ^ ^ ^ anchored feet run function note_block_interface:click/setup
scoreboard players reset @a gm4_nbi_sneak
