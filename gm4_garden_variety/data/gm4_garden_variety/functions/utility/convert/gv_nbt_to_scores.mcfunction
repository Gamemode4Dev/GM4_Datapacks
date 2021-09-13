# converts nbt values into scoreboard values
# run from gm4_garden_variety:mechanics/custom_sapling/destroy
# run from gm4_garden_variety:mechanics/custom_sapling/generate_tree


# reset scores
scoreboard players reset * gm4_gv_nbt_data


### DEBUG ###
# clearance checker
execute if data storage gm4_garden_variety:convert/to_scores input.debug{clearance_checker:0b} run scoreboard players set $clearance_checker gm4_gv_nbt_data 0
# always mutate
execute if data storage gm4_garden_variety:convert/to_scores input.debug{always_mutate:1b} run scoreboard players set $always_mutate gm4_gv_nbt_data 1


### OTHER ###
# name tag
execute if data storage gm4_garden_variety:convert/to_scores input{name_tag:1b} run scoreboard players set $name_tag gm4_gv_nbt_data 1


### MUTATIONS ###
# tree height
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Height",value:"Shortest"}] run scoreboard players set $height gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Height",value:"Shorter"}] run scoreboard players set $height gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Height",value:"Short"}] run scoreboard players set $height gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Height",value:"Tall"}] run scoreboard players set $height gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Height",value:"Taller"}] run scoreboard players set $height gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Height",value:"Tallest"}] run scoreboard players set $height gm4_gv_nbt_data 3
# tree flexibility
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flexibility",value:"Lowest"}] run scoreboard players set $flexibility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flexibility",value:"Lower"}] run scoreboard players set $flexibility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flexibility",value:"Low"}] run scoreboard players set $flexibility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flexibility",value:"High"}] run scoreboard players set $flexibility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flexibility",value:"Higher"}] run scoreboard players set $flexibility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flexibility",value:"Highest"}] run scoreboard players set $flexibility gm4_gv_nbt_data 3
# tree foliage
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Foliage",value:"Smallest"}] run scoreboard players set $foliage gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Foliage",value:"Smaller"}] run scoreboard players set $foliage gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Foliage",value:"Small"}] run scoreboard players set $foliage gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Foliage",value:"Large"}] run scoreboard players set $foliage gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Foliage",value:"Larger"}] run scoreboard players set $foliage gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Foliage",value:"Largest"}] run scoreboard players set $foliage gm4_gv_nbt_data 3
# tree fertility
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fertility",value:"Lowest"}] run scoreboard players set $fertility gm4_gv_nbt_data -3
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fertility",value:"Lower"}] run scoreboard players set $fertility gm4_gv_nbt_data -2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fertility",value:"Low"}] run scoreboard players set $fertility gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fertility",value:"High"}] run scoreboard players set $fertility gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fertility",value:"Higher"}] run scoreboard players set $fertility gm4_gv_nbt_data 2
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fertility",value:"Highest"}] run scoreboard players set $fertility gm4_gv_nbt_data 3
# roots
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Roots",value:"No"}] run scoreboard players set $roots gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Roots",value:"Weak"}] run scoreboard players set $roots gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Roots",value:"Strong"}] run scoreboard players set $roots gm4_gv_nbt_data 2
# corrosion
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Corrosion",value:"No"}] run scoreboard players set $corrosion gm4_gv_nbt_data 0
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Corrosion",value:"Decreased"}] run scoreboard players set $corrosion gm4_gv_nbt_data -1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Corrosion",value:"Increased"}] run scoreboard players set $corrosion gm4_gv_nbt_data 1
# others
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Poisonous"}] run scoreboard players set $poisonous gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Hardened"}] run scoreboard players set $hardened gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Sterile"}] run scoreboard players set $sterile gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Fruity"}] run scoreboard players set $fruity gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Necrotic"}] run scoreboard players set $necrotic gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Flowering"}] run scoreboard players set $flowering gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Snowy"}] run scoreboard players set $snowy gm4_gv_nbt_data 1
execute if data storage gm4_garden_variety:convert/to_scores input.mutations[{mutation:"Radiating"}] run scoreboard players set $radiating gm4_gv_nbt_data 1

# expansion support
function #gm4_garden_variety:utility/convert/gv_nbt_to_scores

# reset storage
data remove storage gm4_garden_variety:convert/to_scores input
