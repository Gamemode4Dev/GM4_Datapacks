execute if score gm4 load.status matches 1 run scoreboard players set gm4_note_block_interface load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Note Block Interface",require:"Gamemode 4"}

execute if score gm4_note_block_interface load.status matches 1 run function gm4_note_block_interface:init
execute unless score gm4_note_block_interface load.status matches 1 run schedule clear gm4_note_block_interface:tick
