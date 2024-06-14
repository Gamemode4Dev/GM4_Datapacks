# checks if lib_machines module is loaded
# @s = forceloaded command block 
# located at 29999998 1 7131
# run from function tag #gm4_forceload:command_block_tick

execute if score gm4_machines load.status matches 1 if score gm4_machines_minor load.status matches 1 run function gm4_machines:tick
