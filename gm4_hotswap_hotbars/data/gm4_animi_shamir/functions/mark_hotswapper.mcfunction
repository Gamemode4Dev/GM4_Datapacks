# Marks Hotswappers as tools for the animi shamir
# run from #gm4_animi_shamir:mark_item_validity

execute if score gm4_hotswap_hotbars load.status matches 1 unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if data entity @s Item{tag:{gm4_hotswap_hotbars:{item:"hotswapper"}}}
