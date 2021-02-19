# @s = area effect cloud ray used to summon a soul fragment
# run from player/ray/hit_block

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s if block ~ ~ ~ #gm4_soul_fragments:air run function gm4_soul_fragments:player/ray/move
