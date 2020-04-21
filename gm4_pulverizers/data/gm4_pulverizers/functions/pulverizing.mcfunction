#@s = pulverizers containing a recipe
#Run from pulverizing

#pulverize
data modify entity @s HandItems[0] set from block ~ ~ ~ Items[0]
function #gm4_pulverizers:pulverize
replaceitem entity @s weapon air

#re-run function until stack is clear or hopper is full
scoreboard players operation stack_size gm4_pul_data -= input_count gm4_pul_data
execute if score stack_size gm4_pul_data >= input_count gm4_pul_data unless data block ~ ~ ~ Items[4] run function gm4_pulverizers:pulverizing
