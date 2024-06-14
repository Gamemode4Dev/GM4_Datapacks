# Checks whether the item id of the item closest to the player matches the item id of an allowed log type
# @s = closest item within 5 blocks of player with Age:0s
# at @s
# run from gm4_arborenda:player/chop

data modify storage gm4_arborenda_shamir:temp item set from entity @s Item.id

execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:oak_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:birch_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:spruce_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:dark_oak_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:acacia_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:jungle_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:mangrove_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:cherry_log"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}

execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:oak_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:birch_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:spruce_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:dark_oak_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:acacia_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:jungle_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:mangrove_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:cherry_wood"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}

execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:crimson_stem"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:warped_stem"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}

execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:crimson_hyphae"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:warped_hyphae"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score $success gm4_arb_data matches 0 store success score $success gm4_arb_data if data storage gm4_arborenda_shamir:temp {item:"minecraft:mangrove_roots"} align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk_source,gm4_arborenda_trunk,gm4_arborenda_init]}

data remove storage gm4_arborenda_shamir:temp item
