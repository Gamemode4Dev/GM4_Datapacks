# runs every tick
# @s = none
# located at world spawn
# run from gm4_machines-1.0:load

schedule function gm4_machines-1.0:tick 1t

# check if machine blocks have been broken or moved
execute as @e[type=marker,tag=gm4_machine_marker] at @s if block ~ ~ ~ #gm4_machines:empty_block run function #gm4_machines:destroy
