# finds the player head that was placed by the player
# @s = player that just placed a machine block player head
# located at @s
# run from gm4_machines:resolve_load/place_machine_block

advancement revoke @s only gm4_machines:place_machine_block

# raycast to find player head
summon marker ~ ~ ~ {Tags:["gm4_machine_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_machine_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_count 0
execute as @e[type=marker,tag=gm4_machine_ray,limit=1] at @s run function gm4_machines-1.0:place_down/ray
execute unless score $found gm4_count matches 1 anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_machine_ray,limit=1] ^ ^ ^ ~ ~
execute unless score $found gm4_count matches 1 as @e[type=marker,tag=gm4_machine_ray,limit=1] at @s run function gm4_machines-1.0:place_down/ray_backup

execute at @e[type=marker,tag=gm4_ray_loc,limit=1] if block ~ ~ ~ #gm4_machines:player_heads run function #gm4_machines:place_down

kill @e[type=marker,tag=gm4_machine_ray]
tag @e[type=marker,tag=gm4_ray_loc] add gm4_machine_marker
tag @e[type=marker] remove gm4_ray_loc
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
