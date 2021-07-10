# @s = players that have placed any type of campfire
# called by advancement gm4_cozy_campfires:place_campfire

# revoke advancement
advancement revoke @s only gm4_cozy_campfires:place_campfire

# start raycast to locate campfire
scoreboard players set ray_step gm4_count 0
scoreboard players set success gm4_count 0
execute anchored eyes positioned ^ ^ ^ run function gm4_cozy_campfires:placement/ray
