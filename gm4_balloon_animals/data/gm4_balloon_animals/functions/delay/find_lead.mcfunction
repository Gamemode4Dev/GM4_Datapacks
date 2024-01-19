# kill lead items from freshly killed natural trader llamas
# @s = marker, tag=gm4_balloon_animal_item_cleanup
# at @s
# run from gm4_balloon_animal:delay/lead_cleanup

kill @e[type=item,distance=..5,nbt={Age:1s}]
kill @s
