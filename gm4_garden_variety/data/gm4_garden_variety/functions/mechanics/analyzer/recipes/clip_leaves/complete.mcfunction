# completes the recipe
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/recipes/clip_leaves/analyzing


##### INITIALIZE #####

# get durability of first slot + slot 1 amount
execute store result score $slot_0_durability gm4_gv_analyzer run data get block ~ ~ ~ Items[{Slot:0b}].tag.Damage
scoreboard players add $slot_0_durability gm4_gv_analyzer 5

# choose random mutation
data remove storage gm4_garden_variety:choose/mutation input
data modify storage gm4_garden_variety:choose/mutation input set from block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety.mutations

# get random roll (used to decide if recipe fails)
scoreboard players set $random_pool gm4_gv_math_num 0
execute store result score $random_pool gm4_gv_math_num run data get storage gm4_garden_variety:choose/mutation input
scoreboard players add $random_pool gm4_gv_math_num 1
function gm4_garden_variety:utility/get/random/roll


##### SLOT MODIFICATIONS #####

# [S0] remove durability base on item count in slot 1 (shears)
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Damage int 1 run scoreboard players get $slot_0_durability gm4_gv_analyzer

# [S1,S2] move items from slot 1 to slot 2 (sapling)
data modify block ~ ~ ~ Items[{Slot:1b}].Slot set value 2b

# [S2] reset mutations (sapling)
data remove block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.mutations

# [S2] set random mutation (sapling)
execute if score $random_roll gm4_gv_math_num matches 2.. run function gm4_garden_variety:utility/mutations/choose_mutation
execute if score $random_roll gm4_gv_math_num matches 2.. run data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.mutations append from storage gm4_garden_variety:choose/mutation output
execute if score $random_roll gm4_gv_math_num matches ..1 run data modify block ~ ~ ~ Items[{Slot:2b}].Count set value 0b


# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete