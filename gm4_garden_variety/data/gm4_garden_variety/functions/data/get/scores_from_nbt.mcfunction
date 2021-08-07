# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from TODO

# reset scores
scoreboard players reset * gm4_gv_nbt_data

# tagged
execute if data storage gm4_garden_variety:data/garden_variety nbt{name_tag:1b} run scoreboard players set name_tag gm4_gv_nbt_data 1

# tagged
execute if data storage gm4_garden_variety:data/garden_variety nbt.generation{soil_conversion:1b} run scoreboard players set soil_conversion gm4_gv_nbt_data 1


# tree height
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{height:"shortest"} run scoreboard players set height gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{height:"shorter"} run scoreboard players set height gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{height:"short"} run scoreboard players set height gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{height:"tall"} run scoreboard players set height gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{height:"taller"} run scoreboard players set height gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{height:"tallest"} run scoreboard players set height gm4_gv_nbt_data 3

# tree flexibility
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{flexibility:"lowest"} run scoreboard players set flexibility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{flexibility:"lower"} run scoreboard players set flexibility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{flexibility:"low"} run scoreboard players set flexibility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{flexibility:"high"} run scoreboard players set flexibility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{flexibility:"higher"} run scoreboard players set flexibility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{flexibility:"highest"} run scoreboard players set flexibility gm4_gv_nbt_data 3

# tree foliage
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{foliage:"smallest"} run scoreboard players set foliage gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{foliage:"smaller"} run scoreboard players set foliage gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{foliage:"small"} run scoreboard players set foliage gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{foliage:"large"} run scoreboard players set foliage gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{foliage:"larger"} run scoreboard players set foliage gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{foliage:"largest"} run scoreboard players set foliage gm4_gv_nbt_data 3

# tree fertility
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{fertility:"lowest"} run scoreboard players set fertility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{fertility:"lower"} run scoreboard players set fertility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{fertility:"low"} run scoreboard players set fertility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{fertility:"high"} run scoreboard players set fertility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{fertility:"higher"} run scoreboard players set fertility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety nbt.traits{fertility:"highest"} run scoreboard players set fertility gm4_gv_nbt_data 3


