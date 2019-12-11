execute if score gm4 load matches 1 run scoreboard players set gm4_note_block_interface load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Note Block Interface",require:"Gamemode 4"}

execute if score gm4_note_block_interface load matches 1 run function note_block_interface:init
execute unless score gm4_note_block_interface load matches 1 run schedule clear note_block_interface:tick
