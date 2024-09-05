# tries to deduct which item was used by the player when interacting with the cauldron by looking at the post-interaction state of the player's held items
# @s = player who has interacted with a cauldron
# at position of cauldron, align xyz
# run from cauldron/liquid/update/level_3/analyze_held_items/select_gamemode

# figure out whether item in main or offhand was used
execute if predicate gm4_zauber_cauldrons:player/equipment/water_bucket/in_mainhand run return 0
execute if predicate gm4_zauber_cauldrons:player/equipment/water_bottle/in_mainhand run return 2
execute if predicate gm4_zauber_cauldrons:player/equipment/water_bucket/in_offhand run return 1
execute if predicate gm4_zauber_cauldrons:player/equipment/water_bottle/in_offhand run return 3
