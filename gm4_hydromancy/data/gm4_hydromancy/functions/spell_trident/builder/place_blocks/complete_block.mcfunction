# place block from stored setblock command
# @s = marker at block display
# at @s
# run from spell_trident/place_blocks/process_block

execute if block ~ ~ ~ #gm4:replaceable run setblock ~ ~ ~ command_block{auto:1b}
data modify block ~ ~ ~ Command set from entity @s data.gm4_hydromancy.stored_command
kill @s
