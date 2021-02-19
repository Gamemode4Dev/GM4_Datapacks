# @s = player approached soul fragment with a soul lantern in main hand
# from player/capture_fragment

# summon temporary nbt storage soul lantern, modify it with score ID from soul fragment, put in storage, modify slot, copy to The Yellow Shulker Box™
function gm4_soul_fragments:player/items/store_captured_soul

# put soul in the player's hand or inventory.
execute if predicate gm4_soul_fragments:count_one/in_mainhand run loot replace entity @s weapon.mainhand 1 mine 29999998 1 7134 minecraft:air{drop_contents: 1b}
execute unless predicate gm4_soul_fragments:count_one/in_mainhand run loot give @s mine 29999998 1 7134 minecraft:air{drop_contents: 1b}
execute unless predicate gm4_soul_fragments:count_one/in_mainhand run function gm4_soul_fragments:player/items/process_mainhand_stack

tag @e[type=item,tag=gm4_sf_nbt_storage] remove gm4_sf_nbt_storage
