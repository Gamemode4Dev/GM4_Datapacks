# run when an item matches the item in the hopper
# @s an item that matches the last item ID in the hopper
# run from check_hopper_filter

execute if block ~ ~ ~ big_dripleaf[facing=west] run data modify entity @s Motion set value [-0.15d,0.07d,0.0d]
execute if block ~ ~ ~ big_dripleaf[facing=east] run data modify entity @s Motion set value [0.15d,0.07d,0.0d]
execute if block ~ ~ ~ big_dripleaf[facing=south] run data modify entity @s Motion set value [0.0d,0.07d,0.15d]
execute if block ~ ~ ~ big_dripleaf[facing=north] run data modify entity @s Motion set value [0.0d,0.07d,-0.15d]
