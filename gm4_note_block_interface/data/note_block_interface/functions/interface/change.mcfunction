#@s = player who has cliked a noteblock while sneaking at the position of the note block
#runs from note_block_interface:click/sneak_loop

#lowers the note of the note block
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change run function note_block_interface:interface/cycle

#resets gm4_nbi_change
scoreboard players reset @s gm4_nbi_change

#runs function to display the note
function note_block_interface:interface/create
