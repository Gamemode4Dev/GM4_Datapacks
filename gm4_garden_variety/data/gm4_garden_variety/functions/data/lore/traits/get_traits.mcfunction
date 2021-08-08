# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from gm4_garden_variety:analyzer/recipes/RECIPE_TYPE/complete

# reset storage
data remove storage gm4_garden_variety:data/item trait_lore

# header
data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"Sapling Mutations","color":"#BD6FFD","italic":false}]'

# height
execute if score $height gm4_gv_nbt_data matches -3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Height: ","color":"gray","italic":false},{"text":"Shortest","color":"gray","italic":false}]'
execute if score $height gm4_gv_nbt_data matches -2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Height: ","color":"gray","italic":false},{"text":"Shorter","color":"gray","italic":false}]'
execute if score $height gm4_gv_nbt_data matches -1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Height: ","color":"gray","italic":false},{"text":"Short","color":"gray","italic":false}]'
execute if score $height gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Height: ","color":"gray","italic":false},{"text":"Tall","color":"gray","italic":false}]'
execute if score $height gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Height: ","color":"gray","italic":false},{"text":"Taller","color":"gray","italic":false}]'
execute if score $height gm4_gv_nbt_data matches 3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Height: ","color":"gray","italic":false},{"text":"Tallest","color":"gray","italic":false}]'
# flexibility
execute if score $flexibility gm4_gv_nbt_data matches -3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flexibility: ","color":"gray","italic":false},{"text":"Lowest","color":"gray","italic":false}]'
execute if score $flexibility gm4_gv_nbt_data matches -2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flexibility: ","color":"gray","italic":false},{"text":"Lower","color":"gray","italic":false}]'
execute if score $flexibility gm4_gv_nbt_data matches -1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flexibility: ","color":"gray","italic":false},{"text":"Low","color":"gray","italic":false}]'
execute if score $flexibility gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flexibility: ","color":"gray","italic":false},{"text":"High","color":"gray","italic":false}]'
execute if score $flexibility gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flexibility: ","color":"gray","italic":false},{"text":"Higher","color":"gray","italic":false}]'
execute if score $flexibility gm4_gv_nbt_data matches 3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flexibility: ","color":"gray","italic":false},{"text":"Highest","color":"gray","italic":false}]'
# foliage
execute if score $foliage gm4_gv_nbt_data matches -3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Foliage: ","color":"gray","italic":false},{"text":"Smallest","color":"gray","italic":false}]'
execute if score $foliage gm4_gv_nbt_data matches -2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Foliage: ","color":"gray","italic":false},{"text":"Smaller","color":"gray","italic":false}]'
execute if score $foliage gm4_gv_nbt_data matches -1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Foliage: ","color":"gray","italic":false},{"text":"Small","color":"gray","italic":false}]'
execute if score $foliage gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Foliage: ","color":"gray","italic":false},{"text":"Large","color":"gray","italic":false}]'
execute if score $foliage gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Foliage: ","color":"gray","italic":false},{"text":"Larger","color":"gray","italic":false}]'
execute if score $foliage gm4_gv_nbt_data matches 3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Foliage: ","color":"gray","italic":false},{"text":"Largest","color":"gray","italic":false}]'
# fertility
execute if score $fertility gm4_gv_nbt_data matches -3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fertility: ","color":"gray","italic":false},{"text":"Lowest","color":"gray","italic":false}]'
execute if score $fertility gm4_gv_nbt_data matches -2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fertility: ","color":"gray","italic":false},{"text":"Lower","color":"gray","italic":false}]'
execute if score $fertility gm4_gv_nbt_data matches -1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fertility: ","color":"gray","italic":false},{"text":"Low","color":"gray","italic":false}]'
execute if score $fertility gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fertility: ","color":"gray","italic":false},{"text":"High","color":"gray","italic":false}]'
execute if score $fertility gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fertility: ","color":"gray","italic":false},{"text":"Higher","color":"gray","italic":false}]'
execute if score $fertility gm4_gv_nbt_data matches 3 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fertility: ","color":"gray","italic":false},{"text":"Highest","color":"gray","italic":false}]'
# rooting
execute if score $rooting gm4_gv_nbt_data matches 0 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Rooting: ","color":"gray","italic":false},{"text":"None","color":"gray","italic":false}]'
execute if score $rooting gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Rooting: ","color":"gray","italic":false},{"text":"Weak","color":"gray","italic":false}]'
execute if score $rooting gm4_gv_nbt_data matches 2 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Rooting: ","color":"gray","italic":false},{"text":"Strong","color":"gray","italic":false}]'
# corrosion
execute if score $corrosion gm4_gv_nbt_data matches 0 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Corrosion: ","color":"gray","italic":false},{"text":"None","color":"gray","italic":false}]'
execute if score $corrosion gm4_gv_nbt_data matches -1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Corrosion: ","color":"gray","italic":false},{"text":"Decreased","color":"gray","italic":false}]'
execute if score $corrosion gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Corrosion: ","color":"gray","italic":false},{"text":"Increased","color":"gray","italic":false}]'
# others
execute if score $poisonous gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Poisonous","color":"gray","italic":false}]'
execute if score $hardened gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Hardened","color":"gray","italic":false}]'
execute if score $sterile gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Sterile","color":"gray","italic":false}]'
execute if score $fruiting gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Fruiting","color":"gray","italic":false}]'
execute if score $necrotic gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Necrotic","color":"gray","italic":false}]'
execute if score $flowering gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Flowering","color":"gray","italic":false}]'
execute if score $snowy gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Snowy","color":"gray","italic":false}]'
execute if score $radiating gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Radiating","color":"gray","italic":false}]'
# special
execute if score $golden_fruit gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"Golden Fruit","color":"gray","italic":false}]'

# get extra lore amount
execute store result score $extra_lore gm4_gv_nbt_data run data get storage gm4_garden_variety:data/item trait_lore
scoreboard players remove $extra_lore gm4_gv_nbt_data 1

# get trait amount
execute store result score $mutations gm4_gv_nbt_data run data get storage gm4_garden_variety:data/item trait_lore
scoreboard players remove $mutations gm4_gv_nbt_data 1

# if no traits
execute unless score $extra_lore gm4_gv_nbt_data matches 1.. run data modify storage gm4_garden_variety:data/item trait_lore append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"None","color":"gray","italic":false}]'
execute unless score $extra_lore gm4_gv_nbt_data matches 1.. run scoreboard players set $extra_lore gm4_gv_nbt_data 1
