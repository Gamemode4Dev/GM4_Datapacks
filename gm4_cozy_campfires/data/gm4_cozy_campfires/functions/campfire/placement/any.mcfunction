# as players that have placed any type of campfire
# at @s
# called by advancement gm4_cozy_campfires:place_campfire

# revoke advancement
advancement revoke @s only gm4_cozy_campfires:place_campfire

# start raycast to locate campfire
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_cozy_campfires_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_cozy_campfires_ray,limit=1,sort=nearest] ^ ^ ^ ~ ~

execute as @e[tag=gm4_cozy_campfires_ray,limit=1,sort=nearest] run function gm4_cozy_campfires:campfire/placement/cast_ray
