# @s = player that just placed a lectern
# run from advancement place_new_lectern

# revoke advancement and summon ray
advancement revoke @s only gm4_book_binders:place_new_lectern
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_book_binders_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_book_binders_ray,limit=1,sort=nearest] ^ ^ ^ ~ ~

execute as @e[tag=gm4_book_binders_ray,limit=1,sort=nearest] run function gm4_book_binders:binder/placement/place_lectern
