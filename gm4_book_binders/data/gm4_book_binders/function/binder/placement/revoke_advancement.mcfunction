# @s = player that just placed a lectern
# at @s
# run from advancement place_new_lectern

# revoke advancement and summon ray
advancement revoke @s only gm4_book_binders:place_new_lectern

# raycast
scoreboard players set gm4_ray_counter gm4_count 0
execute anchored eyes positioned ^ ^ ^ run function gm4_book_binders:binder/placement/find_lectern
