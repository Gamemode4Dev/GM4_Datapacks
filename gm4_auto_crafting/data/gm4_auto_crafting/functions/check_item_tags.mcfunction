# checks each slot for item tags
# @s = crafter armor stand
# located at the center of the block
# run from gm4_custom_crafters-3.0:process_input/check_item_tags via #gm4_custom_crafters:custom_item_checks

execute if predicate gm4_auto_crafting:custom_item_tags/fire_charge_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.fire_charge_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/purpur_slab_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.purpur_slab_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/purpur_stairs_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.purpur_stairs_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/quartz_slab_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.quartz_slab_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/quartz_stairs_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.quartz_stairs_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/red_sandstone_slab_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.red_sandstone_slab_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/red_sandstone_stairs_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.red_sandstone_stairs_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/sandstone_slab_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.sandstone_slab_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/sandstone_stairs_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.sandstone_stairs_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/soul_torch_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.soul_torch_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/tnt_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.tnt_ingredient_1 set value 1b
execute if predicate gm4_auto_crafting:custom_item_tags/torch_ingredient_1 run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_auto_crafting.torch_ingredient_1 set value 1b

