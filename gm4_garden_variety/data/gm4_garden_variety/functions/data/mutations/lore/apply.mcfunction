# generates the tree's leaf layers
# @s = Item
# run from TODO


# SET VALUES
# gm4_garden_variety:modify/item input
# gm4_garden_variety:modify/item modifier

### INIT ###

# reset and copy storage
data remove storage gm4_garden_variety:add/lore lines
data modify storage gm4_garden_variety:modify/item output set from storage gm4_garden_variety:modify/item input

# convert nbt to scores
execute store result score $extra_lore gm4_gv_nbt_data run data get storage gm4_garden_variety:modify/item modifier.tag.gm4_garden_variety.mutations
execute store result score $mutations gm4_gv_nbt_data run data get storage gm4_garden_variety:modify/item modifier.tag.gm4_garden_variety.mutations

# isolate mutations
data modify storage gm4_garden_variety:interpret/array mutations set from storage gm4_garden_variety:modify/item modifier.tag.gm4_garden_variety.mutations


### APPLY LORE ###

# remove lore
function gm4_garden_variety:data/mutations/lore/remove

# header
data modify storage gm4_garden_variety:add/lore lines append value '[{"text":"Sapling Mutations","color":"#BD6FFD","italic":false}]'

# if no mutations
execute unless score $extra_lore gm4_gv_nbt_data matches 1.. run data modify storage gm4_garden_variety:add/lore lines append value '[{"text":"> ","color":"#BD6FFD","italic":false},{"text":"None","color":"gray","italic":false}]'
execute unless score $extra_lore gm4_gv_nbt_data matches 1.. run scoreboard players set $extra_lore gm4_gv_nbt_data 1

# get mutations
scoreboard players operation $mutation_lore_loop gm4_gv_mutations = $mutations gm4_gv_nbt_data
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_get_mutations"],Items:[{Slot:2b,id:"minecraft:stone",Count:1b}]}
execute if score $mutation_lore_loop gm4_gv_mutations matches 1.. run function gm4_garden_variety:data/mutations/lore/get_mutations
execute as @e[type=trader_llama,tag=gm4_gv_get_mutations] run data merge entity @s {Health:0,DeathTime:19}

# add mutations
data modify storage gm4_garden_variety:modify/item output.tag.display.Lore append from storage gm4_garden_variety:add/lore lines[]

# add lore nbt
data modify storage gm4_garden_variety:modify/item output.tag.gm4_garden_variety.lore.show_mutations set value 1b
execute store result storage gm4_garden_variety:modify/item output.tag.gm4_garden_variety.lore.extra_lore int 1 run scoreboard players get $extra_lore gm4_gv_nbt_data
execute store result storage gm4_garden_variety:modify/item output.tag.gm4_garden_variety.lore.mutations int 1 run scoreboard players get $mutations gm4_gv_nbt_data
