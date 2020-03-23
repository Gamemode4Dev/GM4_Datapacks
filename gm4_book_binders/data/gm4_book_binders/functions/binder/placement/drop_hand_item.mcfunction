# @s a book binder NOT inside a lectern, with items in the hand slot
# at @s
# run from gm4_book_binders:binder/placement/kill

# summon hand item as item entity
summon item ~ ~ ~ {Tags:["gm4_empty_hand_item"],PickupDelay:0s,Item:{id:"minecraft:wooden_hoe",Count:1b}}
data modify entity @e[type=item,limit=1,sort=nearest,tag=gm4_empty_hand_item,dx=0] Item set from entity @s HandItems[0]
