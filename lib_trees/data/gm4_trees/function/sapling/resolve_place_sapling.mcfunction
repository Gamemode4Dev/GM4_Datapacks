# Datapack hook-in point. Validates the library version in case multiple versions are installed.
# run from function tag gm4_trees:place_sapling

execute if score gm4_trees load.status matches 1 if score gm4_trees_minor load.status matches 4 run function gm4_trees:sapling/place_sapling
