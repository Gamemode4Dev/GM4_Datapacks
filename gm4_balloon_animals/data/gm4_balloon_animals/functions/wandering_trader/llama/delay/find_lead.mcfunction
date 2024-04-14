# @s = marker, tag=gm4_balloon_animal_item_cleanup
# at @s
# run from wandering_trader/llama/delay/lead_cleanup

kill @e[type=item,distance=..5,nbt={Age:1s},limit=2]
kill @s
