#@s = pulverizers containing a recipe
#Run from pulverize_validity_check

#pulverize the items
function gm4_pulverizers:pulverizing

#remove items that were pulverized
execute store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get stack_size gm4_pul_data
execute if score stack_size gm4_pul_data matches 0 run data remove block ~ ~ ~ Items[{Slot:0b}]

#visuals
playsound minecraft:block.grindstone.use block @a[distance=..12] ~ ~ ~ .3 .1
particle minecraft:cloud ~ ~.5 ~ .3 .2 .3 0 7
