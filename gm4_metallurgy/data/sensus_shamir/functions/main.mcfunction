#@s player holding sensus
#run from metallurgy main
tag @s add gm4_has_sensus
execute if score current_sensus_layer gm4_sensus_layer matches 0 positioned ~-3 ~-2 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_sensus_layer matches 1 positioned ~-3 ~-1 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_sensus_layer matches 2 positioned ~-3 ~0 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_sensus_layer matches 3 positioned ~-3 ~1 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_sensus_layer matches 4 positioned ~-3 ~2 ~-3 run function sensus_shamir:block_search/search
execute if score current_sensus_layer gm4_sensus_layer matches 5 positioned ~-3 ~3 ~-3 run function sensus_shamir:block_search/search
