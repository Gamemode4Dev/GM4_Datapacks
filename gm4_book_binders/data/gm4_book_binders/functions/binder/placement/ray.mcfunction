# @s = area effect cloud ray used to detect a lectern
# run from binder/placement/place_lectern

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ lectern run function gm4_book_binders:binder/placement/ray
