# checks if player tuned the note block
# @s = player clicking note block
# at @s
# run from advancement click

advancement revoke @s only gm4_note_block_interface:click

# tests if the player has tuned a note block
execute if entity @s[scores={gm4_nbi_click=1..}] anchored eyes positioned ^ ^ ^ run function gm4_note_block_interface:click/setup
