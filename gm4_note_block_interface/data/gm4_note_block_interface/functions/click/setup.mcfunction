#@s = player who has punched a note block
#runs from note_block_interface:pulse_check

#resets click scores
scoreboard players reset @s gm4_nbi_click
#sets raycast limit
scoreboard players set @s gm4_nbi_ray 50
#runs raycast loop
execute unless score @s gm4_nbi_sneak matches 1.. run function gm4_note_block_interface:click/loop
execute if score @s gm4_nbi_sneak matches 1.. run function gm4_note_block_interface:click/sneak_loop
