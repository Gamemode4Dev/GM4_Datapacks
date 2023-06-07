# handles growth of golden apple roots
# @s = gm4_golden_root marker
# located at @s
# run from gm4_golden_apple_trees:root/process

# rotate to next root location
tp @s ~ ~ ~ ~120 0

# grow the root
summon marker ^ ^-1 ^1 {Tags:["gm4_golden_apple_root_ray"]}
tp @e[type=marker,tag=gm4_golden_apple_root_ray,limit=1] @s

execute as @e[type=marker,tag=gm4_golden_apple_root_ray,limit=1] at @s if block ~ ~ ~ gold_ore run function gm4_golden_apple_trees:root/raycast
execute at @e[type=marker,tag=gm4_golden_apple_root_ray] if block ~ ~ ~ #gm4_golden_apple_trees:rootable run function gm4_golden_apple_trees:root/place

# clean up
scoreboard players reset @s gm4_ga_root
scoreboard players reset @e[type=marker,tag=gm4_golden_apple_root_ray] gm4_ga_root_count
kill @e[type=marker,tag=gm4_golden_apple_root_ray]
