# spread kelp to nearby blocks
# @s = growth marker
# at @s
# run from coral_core/growth/raycast

# mark possible growth locations
execute positioned ~1 ~1 ~ run function gm4_hydromancy:coral_core/growth/kelp/check_spread
execute positioned ~-1 ~1 ~ run function gm4_hydromancy:coral_core/growth/kelp/check_spread
execute positioned ~ ~1 ~1 run function gm4_hydromancy:coral_core/growth/kelp/check_spread
execute positioned ~ ~1 ~-1 run function gm4_hydromancy:coral_core/growth/kelp/check_spread

# stop raycast
scoreboard players set $raycast_limit gm4_hy_data 0

# grow kelp
execute at @e[type=marker,tag=gm4_hy_possible_kelp,limit=1,sort=random] run setblock ~ ~ ~ kelp[age=0]
execute as @e[type=marker,tag=gm4_hy_possible_kelp] at @s if block ~ ~ ~ kelp run function gm4_hydromancy:coral_core/growth/vfx
kill @e[type=marker,tag=gm4_hy_possible_kelp]
