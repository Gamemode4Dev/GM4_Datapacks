# marches forward until a lectern is encountered
# @s = player who has placed down a lectern
# at start location
# run from binder/placement/revoke_advancement

scoreboard players add gm4_ray_counter gm4_count 1
execute unless block ~ ~ ~ lectern if score gm4_ray_counter gm4_count matches 0..500 positioned ^ ^ ^0.01 run function gm4_book_binders:binder/placement/find_lectern
execute if block ~ ~ ~ lectern align xyz unless entity @e[type=armor_stand,dx=0,tag=gm4_book_binder,limit=1] run function gm4_book_binders:binder/placement/detect_facing
