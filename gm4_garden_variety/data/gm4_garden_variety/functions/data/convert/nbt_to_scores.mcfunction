# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from TODO

# reset scores
scoreboard players reset * gm4_gv_nbt_data



# clearance checker
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{clearance_checker:0b} run scoreboard players set $clearance_checker gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{clearance_checker:1b} run scoreboard players set $clearance_checker gm4_gv_nbt_data 1

# soil converstion
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{soil_conversion:0b} run scoreboard players set $soil_conversion gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{soil_conversion:1b} run scoreboard players set $soil_conversion gm4_gv_nbt_data 1

# rooting
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{rooting:0b} run scoreboard players set $rooting gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{rooting:1b} run scoreboard players set $rooting gm4_gv_nbt_data 1



# name tag
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert{name_tag:1b} run scoreboard players set $name_tag gm4_gv_nbt_data 1

# tree height
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{height:"shortest"} run scoreboard players set $height gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{height:"shorter"} run scoreboard players set $height gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{height:"short"} run scoreboard players set $height gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{height:"tall"} run scoreboard players set $height gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{height:"taller"} run scoreboard players set $height gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{height:"tallest"} run scoreboard players set $height gm4_gv_nbt_data 3

# tree flexibility
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flexibility:"lowest"} run scoreboard players set $flexibility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flexibility:"lower"} run scoreboard players set $flexibility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flexibility:"low"} run scoreboard players set $flexibility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flexibility:"high"} run scoreboard players set $flexibility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flexibility:"higher"} run scoreboard players set $flexibility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flexibility:"highest"} run scoreboard players set $flexibility gm4_gv_nbt_data 3

# tree foliage
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{foliage:"smallest"} run scoreboard players set $foliage gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{foliage:"smaller"} run scoreboard players set $foliage gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{foliage:"small"} run scoreboard players set $foliage gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{foliage:"large"} run scoreboard players set $foliage gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{foliage:"larger"} run scoreboard players set $foliage gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{foliage:"largest"} run scoreboard players set $foliage gm4_gv_nbt_data 3

# tree fertility
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fertility:"lowest"} run scoreboard players set $fertility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fertility:"lower"} run scoreboard players set $fertility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fertility:"low"} run scoreboard players set $fertility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fertility:"high"} run scoreboard players set $fertility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fertility:"higher"} run scoreboard players set $fertility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fertility:"highest"} run scoreboard players set $fertility gm4_gv_nbt_data 3

# rooting
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{rooting:"none"} run scoreboard players set $rooting gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{rooting:"weak"} run scoreboard players set $rooting gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{rooting:"strong"} run scoreboard players set $rooting gm4_gv_nbt_data 2

# corrosion
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{corrosion:"none"} run scoreboard players set $corrosion gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{corrosion:"decreased"} run scoreboard players set $corrosion gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{corrosion:"increased"} run scoreboard players set $corrosion gm4_gv_nbt_data 1

# others
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{poisonous:1b} run scoreboard players set $poisonous gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{hardened:1b} run scoreboard players set $hardened gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{sterile:1b} run scoreboard players set $sterile gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{fruiting:1b} run scoreboard players set $fruiting gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{necrotic:1b} run scoreboard players set $necrotic gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{flowering:1b} run scoreboard players set $flowering gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{snowy:1b} run scoreboard players set $snowy gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{radiating:1b} run scoreboard players set $radiating gm4_gv_nbt_data 1

# special
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations{golden_fruit:1b} run scoreboard players set $golden_fruit gm4_gv_nbt_data 1


# reset storage
data remove storage gm4_garden_variety:data/garden_variety_nbt convert
