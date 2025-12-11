# spawn the seat in the correct place
# @s = furniture's seat item_display entity
# at @s
# run from interact/sit/find_seat
# with {height}

# the item_display is offset from the ground to dictate sit height
$execute positioned ~.5 ~.$(height) ~.5 summon item_display run function gm4_furniture:interact/sit/init_seat
