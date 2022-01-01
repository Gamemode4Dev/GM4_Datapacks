# Marks Orbs of Ankou as tools for the animi shamir
# run from #gm4_animi_shamir:mark_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if data entity @s Item{id:"minecraft:firework_star",tag:{gm4_orb_of_ankou:{item:"orb"}}}
