# tries to deduct which item was used by the player when interacting with the cauldron by looking at the post-interaction state of the player's held items
# @s = player who has interacted with a cauldron
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/level_3/reconstruct_interaction

# figure out whether item in main or offhand was stored
# this is so complicated because when starting out with a level=2 cauldron there are two cases which can not be
# distinguished only from looking at the cauldron's final level (level=3) and the items of the player after the interaction:
# A) Offhand: Empty Bottle, Mainhand: Full Bucket
# B) Offhand: Full Bottle, Mainhand: Empty Bucket
# Both A) and B) result in a level=3 cauldron and the player holding Offhand:Empty Bottle, Mainhand: Empty Bucket
# but buckets and bottles act differently on cauldrons. Therefore we simply ignore this case, which will lead to the player
# losing either the contents of a bucket or of a filled bottle when they try to add liquid in state A) or B). 
execute if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_mainhand run return 2
execute if predicate gm4_zauber_cauldrons:player/equipment/bucket/in_mainhand if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_offhand run return -1
execute if predicate gm4_zauber_cauldrons:player/equipment/bucket/in_mainhand run return 0
execute if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_offhand run return 3
execute if predicate gm4_zauber_cauldrons:player/equipment/bucket/in_offhand run return 1
