# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from TODO

# reset scores
scoreboard players reset * gm4_gv_nbt_data

# clearance checker
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.generation{clearance_checker:0b} run scoreboard players set $clearance_checker gm4_gv_nbt_data 0

# name tag
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert{name_tag:1b} run scoreboard players set $name_tag gm4_gv_nbt_data 1

# tree height
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Height",value:"Shortest"}] run scoreboard players set $height gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Height",value:"Shorter"}] run scoreboard players set $height gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Height",value:"Short"}] run scoreboard players set $height gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Height",value:"Tall"}] run scoreboard players set $height gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Height",value:"Taller"}] run scoreboard players set $height gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Height",value:"Tallest"}] run scoreboard players set $height gm4_gv_nbt_data 3

# tree flexibility
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flexibility",value:"Lowest"}] run scoreboard players set $flexibility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flexibility",value:"Lower"}] run scoreboard players set $flexibility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flexibility",value:"Low"}] run scoreboard players set $flexibility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flexibility",value:"High"}] run scoreboard players set $flexibility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flexibility",value:"Higher"}] run scoreboard players set $flexibility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flexibility",value:"Highest"}] run scoreboard players set $flexibility gm4_gv_nbt_data 3

# tree foliage
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Foliage",value:"Smallest"}] run scoreboard players set $foliage gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Foliage",value:"Smaller"}] run scoreboard players set $foliage gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Foliage",value:"Small"}] run scoreboard players set $foliage gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Foliage",value:"Large"}] run scoreboard players set $foliage gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Foliage",value:"Larger"}] run scoreboard players set $foliage gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Foliage",value:"Largest"}] run scoreboard players set $foliage gm4_gv_nbt_data 3

# tree fertility
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fertility",value:"Lowest"}] run scoreboard players set $fertility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fertility",value:"Lower"}] run scoreboard players set $fertility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fertility",value:"Low"}] run scoreboard players set $fertility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fertility",value:"High"}] run scoreboard players set $fertility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fertility",value:"Higher"}] run scoreboard players set $fertility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fertility",value:"Highest"}] run scoreboard players set $fertility gm4_gv_nbt_data 3

# roots
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Roots",value:"No"}] run scoreboard players set $roots gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Roots",value:"Weak"}] run scoreboard players set $roots gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Roots",value:"Strong"}] run scoreboard players set $roots gm4_gv_nbt_data 2

# corrosion
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Corrosion",value:"No"}] run scoreboard players set $corrosion gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Corrosion",value:"Decreased"}] run scoreboard players set $corrosion gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Corrosion",value:"Increased"}] run scoreboard players set $corrosion gm4_gv_nbt_data 1

# others
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Poisonous"}] run scoreboard players set $poisonous gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Hardened"}] run scoreboard players set $hardened gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Sterile"}] run scoreboard players set $sterile gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Fruity"}] run scoreboard players set $fruity gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Necrotic"}] run scoreboard players set $necrotic gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Flowering"}] run scoreboard players set $flowering gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Snowy"}] run scoreboard players set $snowy gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:data/garden_variety_nbt convert.mutations[{mutation:"Radiating"}] run scoreboard players set $radiating gm4_gv_nbt_data 1

# reset storage
data remove storage gm4_garden_variety:data/garden_variety_nbt convert
