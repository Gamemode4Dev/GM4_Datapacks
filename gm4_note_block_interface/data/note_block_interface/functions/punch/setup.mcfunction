#@s = player who has punched a note block
#runs from note_block_interface:pulse_check

#resets click scores
scoreboard players reset @s gm4_nbi_punch
#sets raycast limit
scoreboard players set @s gm4_nbi_ray 50
#runs raycast loop
function note_block_interface:punch/loop
