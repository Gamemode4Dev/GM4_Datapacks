


# set storage "gm4_garden_variety:data/garden_variety_nbt mutations" before this function

# reset
data remove storage gm4_garden_variety:data/garden_variety_nbt mutations.array
data remove storage gm4_garden_variety:data/garden_variety_nbt mutations.selected
data remove storage gm4_garden_variety:data/garden_variety_nbt mutations.output

# copy base muations into an array
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.height run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {height:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.flexibility run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {flexibility:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.foliage run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {foliage:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.fertility run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {fertility:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.rooting run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {rooting:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.corrosion run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {corrosion:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.poisonous run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {poisonous:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.hardened run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {hardened:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.sterile run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {sterile:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.fruiting run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {fruiting:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.necrotic run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {necrotic:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.flowering run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {flowering:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.snowy run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {snowy:1b}
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.radiating run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.array append value {radiating:1b}

# get mutation amount
execute store result score $mutation_amount gm4_gv_nbt_data run data get storage gm4_garden_variety:data/garden_variety_nbt mutations.array

# select random mutaton
execute store result score $random_mutation gm4_gv_nbt_data run time query gametime
scoreboard players operation $random_mutation gm4_gv_nbt_data %= $mutation_amount gm4_gv_nbt_data

# copy mutation
execute if score $random_mutation gm4_gv_nbt_data matches 0 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[0]
execute if score $random_mutation gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[1]
execute if score $random_mutation gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[2]
execute if score $random_mutation gm4_gv_nbt_data matches 3 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[3]
execute if score $random_mutation gm4_gv_nbt_data matches 4 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[4]
execute if score $random_mutation gm4_gv_nbt_data matches 5 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[5]
execute if score $random_mutation gm4_gv_nbt_data matches 6 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[6]
execute if score $random_mutation gm4_gv_nbt_data matches 7 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[7]
execute if score $random_mutation gm4_gv_nbt_data matches 8 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[8]
execute if score $random_mutation gm4_gv_nbt_data matches 9 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[9]
execute if score $random_mutation gm4_gv_nbt_data matches 10 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[10]
execute if score $random_mutation gm4_gv_nbt_data matches 11 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[11]
execute if score $random_mutation gm4_gv_nbt_data matches 12 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[12]
execute if score $random_mutation gm4_gv_nbt_data matches 13 run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.selected set from storage gm4_garden_variety:data/garden_variety_nbt mutations.array[13]

# set mutation
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.height run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.height set from storage gm4_garden_variety:data/garden_variety_nbt mutations.height
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.flexibility run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.flexibility set from storage gm4_garden_variety:data/garden_variety_nbt mutations.flexibility
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.foliage run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.foliage set from storage gm4_garden_variety:data/garden_variety_nbt mutations.foliage
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.fertility run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.fertility set from storage gm4_garden_variety:data/garden_variety_nbt mutations.fertility
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.rooting run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.rooting set from storage gm4_garden_variety:data/garden_variety_nbt mutations.rooting
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.corrosion run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.corrosion set from storage gm4_garden_variety:data/garden_variety_nbt mutations.corrosion
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.poisonous run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.poisonous set from storage gm4_garden_variety:data/garden_variety_nbt mutations.poisonous
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.hardened run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.hardened set from storage gm4_garden_variety:data/garden_variety_nbt mutations.hardened
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.sterile run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.sterile set from storage gm4_garden_variety:data/garden_variety_nbt mutations.sterile
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.fruiting run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.fruiting set from storage gm4_garden_variety:data/garden_variety_nbt mutations.fruiting
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.necrotic run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.necrotic set from storage gm4_garden_variety:data/garden_variety_nbt mutations.necrotic
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.flowering run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.flowering set from storage gm4_garden_variety:data/garden_variety_nbt mutations.flowering
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.snowy run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.snowy set from storage gm4_garden_variety:data/garden_variety_nbt mutations.snowy
execute if data storage gm4_garden_variety:data/garden_variety_nbt mutations.selected.radiating run data modify storage gm4_garden_variety:data/garden_variety_nbt mutations.output.radiating set from storage gm4_garden_variety:data/garden_variety_nbt mutations.radiating
