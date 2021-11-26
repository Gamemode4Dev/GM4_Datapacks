# finds the player head that was placed by the player
# @s = player that just placed a machine block player head
# located at @s
# run from gm4_machines:resolve_load/place_machine_block

advancement revoke @s only gm4_machines-1.0:place_machine_block

# raycast to find player head
summon marker ~ ~ ~ {Tags:["gm4_machine_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_machine_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_machine_data 0
execute as @e[type=marker,tag=gm4_machine_ray,limit=1] at @s run function gm4_machines-1.0:place_down/ray

# place machine block at location of player head
execute at @e[type=marker,tag=gm4_new_machine_marker,limit=1] run function gm4_machines-1.0:place_down/prep_place

# clean up
kill @e[type=marker,tag=gm4_machine_ray]
tag @e[type=marker,tag=gm4_machine_marker] remove gm4_new_machine_marker
data remove storage gm4_machines:temp machine_data
