# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from TODO



# tagged
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree{nametag:0b} run scoreboard players set nametag gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree{nametag:1b} run scoreboard players set nametag gm4_gv_nbt_data 1

# tagged
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.generation{soil_conversion:0b} run scoreboard players set soil_conversion gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.generation{soil_conversion:1b} run scoreboard players set soil_conversion gm4_gv_nbt_data 1


# tree height
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"shortest"} run scoreboard players set height gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"shorter"} run scoreboard players set height gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"short"} run scoreboard players set height gm4_gv_nbt_data 3
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"average"} run scoreboard players set height gm4_gv_nbt_data 4
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"tall"} run scoreboard players set height gm4_gv_nbt_data 5
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"taller"} run scoreboard players set height gm4_gv_nbt_data 6
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{height:"tallest"} run scoreboard players set height gm4_gv_nbt_data 7

# tree flexibility
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"lowest"} run scoreboard players set flexibility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"lower"} run scoreboard players set flexibility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"low"} run scoreboard players set flexibility gm4_gv_nbt_data 3
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"average"} run scoreboard players set flexibility gm4_gv_nbt_data 4
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"high"} run scoreboard players set flexibility gm4_gv_nbt_data 5
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"higher"} run scoreboard players set flexibility gm4_gv_nbt_data 6
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{flexibility:"highest"} run scoreboard players set flexibility gm4_gv_nbt_data 7

# tree foliage
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"smallest"} run scoreboard players set foliage gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"smaller"} run scoreboard players set foliage gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"small"} run scoreboard players set foliage gm4_gv_nbt_data 3
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"average"} run scoreboard players set foliage gm4_gv_nbt_data 4
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"large"} run scoreboard players set foliage gm4_gv_nbt_data 5
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"larger"} run scoreboard players set foliage gm4_gv_nbt_data 6
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{foliage:"largest"} run scoreboard players set foliage gm4_gv_nbt_data 7

# tree fertility
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"lowest"} run scoreboard players set fertility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"lower"} run scoreboard players set fertility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"low"} run scoreboard players set fertility gm4_gv_nbt_data 3
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"average"} run scoreboard players set fertility gm4_gv_nbt_data 4
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"high"} run scoreboard players set fertility gm4_gv_nbt_data 5
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"higher"} run scoreboard players set fertility gm4_gv_nbt_data 6
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{fertility:"highest"} run scoreboard players set fertility gm4_gv_nbt_data 7

# tree abnormality
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"none"} run scoreboard players set abnormality gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"poisonous"} run scoreboard players set abnormality gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"smelly"} run scoreboard players set abnormality gm4_gv_nbt_data 3
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"acidic"} run scoreboard players set abnormality gm4_gv_nbt_data 4
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"tough"} run scoreboard players set abnormality gm4_gv_nbt_data 5
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"sterile"} run scoreboard players set abnormality gm4_gv_nbt_data 6
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"fruiting"} run scoreboard players set abnormality gm4_gv_nbt_data 7
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"snowy"} run scoreboard players set abnormality gm4_gv_nbt_data 8
execute if data storage gm4_garden_variety:data/garden_variety_nbt tree.traits{abnormality:"necrotic"} run scoreboard players set abnormality gm4_gv_nbt_data 9
