# @s = area effect cloud ray used to find air
# run from active

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.1
execute if score gm4_ray_counter gm4_count matches 0..30 at @s positioned ^ ^ ^0.1 if block ~ ~ ~ #gm4:air positioned as @s run function gm4_fulcio_shamir:ray
