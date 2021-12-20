# change note to decrease instead of increase
# @s = player tuning note block while sneaking
# at note block
# run from gm4_note_block_interface:tune/sneak_loop

# lowers the note of the note block
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=0] run setblock ~ ~ ~ note_block[note=23]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=1] run setblock ~ ~ ~ note_block[note=24]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=2] run setblock ~ ~ ~ note_block[note=0]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=3] run setblock ~ ~ ~ note_block[note=1]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=4] run setblock ~ ~ ~ note_block[note=2]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=5] run setblock ~ ~ ~ note_block[note=3]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=6] run setblock ~ ~ ~ note_block[note=4]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=7] run setblock ~ ~ ~ note_block[note=5]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=8] run setblock ~ ~ ~ note_block[note=6]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=9] run setblock ~ ~ ~ note_block[note=7]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=10] run setblock ~ ~ ~ note_block[note=8]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=11] run setblock ~ ~ ~ note_block[note=9]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=12] run setblock ~ ~ ~ note_block[note=10]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=13] run setblock ~ ~ ~ note_block[note=11]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=14] run setblock ~ ~ ~ note_block[note=12]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=15] run setblock ~ ~ ~ note_block[note=13]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=16] run setblock ~ ~ ~ note_block[note=14]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=17] run setblock ~ ~ ~ note_block[note=15]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=18] run setblock ~ ~ ~ note_block[note=16]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=19] run setblock ~ ~ ~ note_block[note=17]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=20] run setblock ~ ~ ~ note_block[note=18]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=21] run setblock ~ ~ ~ note_block[note=19]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=22] run setblock ~ ~ ~ note_block[note=20]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=23] run setblock ~ ~ ~ note_block[note=21]
execute unless score @s gm4_nbi_change matches 1.. store success score @s gm4_nbi_change if block ~ ~ ~ note_block[note=24] run setblock ~ ~ ~ note_block[note=22]

# resets gm4_nbi_change
scoreboard players reset @s gm4_nbi_change

# runs function to display the note
function gm4_note_block_interface:interface/create
