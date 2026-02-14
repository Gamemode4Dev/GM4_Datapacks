# check if this seat entity still has an occupant, if not remove it
# @s = furniture's seat item_display entity
# at unspecified
# run from interact/sit/find_seat
# run from slow_clock

scoreboard players set $keep_seat gm4_furniture_data 0
execute on passengers run scoreboard players set $keep_seat gm4_furniture_data 1
execute if score $keep_seat gm4_furniture_data matches 0 run kill @s
