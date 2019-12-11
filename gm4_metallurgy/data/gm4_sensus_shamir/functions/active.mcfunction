#@s player holding sensus
#run from metallurgy:has_shamir
tag @s add gm4_has_sensus
execute if score current_sensus_layer gm4_ml_data matches 0 positioned ~-3 ~-2 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_ml_data matches 1 positioned ~-3 ~-1 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_ml_data matches 2 positioned ~-3 ~0 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_ml_data matches 3 positioned ~-3 ~1 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_ml_data matches 4 positioned ~-3 ~2 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_ml_data matches 5 positioned ~-3 ~3 ~-3 run function sensus_shamir:block_search/search
