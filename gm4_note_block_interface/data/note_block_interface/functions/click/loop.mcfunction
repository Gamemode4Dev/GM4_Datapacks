#@s = player who played a note block
#runs from note_block_interface:click/setup

#removes 1 from raycast
scoreboard players remove @s gm4_nbi_ray 1
#tests for note_block
execute if block ~ ~ ~ note_block align xyz positioned ~0.5 ~0.6 ~0.5 run function note_block_interface:interface/create
#runs the loop again
execute unless block ~ ~ ~ note_block if score @s gm4_nbi_ray matches 1.. positioned ^ ^ ^0.1 run function note_block_interface:click/loop
