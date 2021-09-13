# generates a random mutation
# run from gm4_garden_variety:mechanics/custom_sapling/apply_random_mutation
# run from gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_mutated_saplings


# register mutations
function #gm4_garden_variety:utility/mutations/random_mutation/register

# store mutation in storage
data remove storage gm4_garden_variety:generate/mutation output 
data modify storage gm4_garden_variety:generate/mutation output set from entity @e[type=trader_llama,tag=gm4_gv_random_mutation,limit=1,sort=random] Items[0].tag.gm4_garden_variety.random_mutation

# kill llama
execute as @e[type=trader_llama,tag=gm4_gv_random_mutation] run data merge entity @s {Health:0,DeathTime:19}

# [Debug]
data modify storage gm4_garden_variety:debug/generate/mutation backlog prepend from storage gm4_garden_variety:generate/mutation output
data remove storage gm4_garden_variety:debug/generate/mutation backlog[10]
