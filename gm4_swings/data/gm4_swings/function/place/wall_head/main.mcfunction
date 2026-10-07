rotate @s facing entity @p[tag=gm4_swings.placer,distance=..20]
execute rotated as @s if entity @s[y_rotation=-22.5..22.5] rotated 0 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=22.5..67.5] rotated 45 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=67.5..112.5] rotated 90 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=112.5..157.5] rotated 135 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=157.5..-157.5] rotated 180 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=-157.5..-112.5] rotated 45 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=-112.5..-67.5] rotated 90 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp
execute rotated as @s if entity @s[y_rotation=-67.5..-22.5] rotated 135 0 run return run function gm4_swings:swing/setup with storage gm4_swings:temp