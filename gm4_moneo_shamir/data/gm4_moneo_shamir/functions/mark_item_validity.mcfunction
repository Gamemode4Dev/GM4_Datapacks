#@s = band is trying to apply to
#run from check_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if predicate gm4_metallurgy:item_type/shovel
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if predicate gm4_metallurgy:item_type/pickaxe
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if predicate gm4_metallurgy:item_type/hoe
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if predicate gm4_metallurgy:item_type/axe
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if predicate gm4_metallurgy:item_type/shears
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if predicate gm4_metallurgy:item_type/elytra
