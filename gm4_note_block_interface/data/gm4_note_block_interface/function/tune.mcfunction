# checks if player tuned the note block
# @s = player tuning note block
# at @s
# run from advancement tune

advancement revoke @s only gm4_note_block_interface:tune

# tests if the player has tuned a note block
execute if entity @s[scores={gm4_nbi_tune=1..}] anchored eyes positioned ^ ^ ^ run function gm4_note_block_interface:tune/setup
