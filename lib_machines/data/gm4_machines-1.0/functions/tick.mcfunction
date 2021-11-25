# runs every tick on the command block subtick; detects when a machine block has been broken
# @s = forceloaded command block 
# located at 29999998 1 7131
# run from gm4_potion_tracking-1.0:resolve_tick

# check if machine blocks have been broken or moved by a piston (note: this assumes that the block is never replaced with a /fill command)
execute as @e[type=marker,tag=gm4_machine_marker] at @s if block ~ ~ ~ #gm4_machines-1.0:empty_block run function #gm4_machines:destroy
