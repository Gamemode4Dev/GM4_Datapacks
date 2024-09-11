# @s = raycast AEC
# at start location
# run from binder/placement/revoke_advancement

scoreboard players set gm4_ray_counter gm4_count 0
execute as @s at @s run function gm4_book_binders:binder/placement/ray

# detect lectern facing and convert to tag
execute at @s align xyz unless entity @e[type=armor_stand,dx=0,dy=0,dz=0,tag=gm4_book_binder] run function gm4_book_binders:binder/placement/detect_facing

# kill ray
kill @s
