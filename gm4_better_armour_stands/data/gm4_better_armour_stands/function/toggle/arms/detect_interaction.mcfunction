# @s = armor_stand to be modified
# at @s
# run from book/hold and toggle/arms/arms

tag @s add gm4_bas_no_arms

# size check
execute store result score $size gm4_bas_data run data get entity @s Small

# place interaction inside armor_stand to detect right click
execute if score $size gm4_bas_data matches 0 run summon minecraft:interaction ~ ~-0.01 ~ {Tags:["smithed.entity","smithed.strict","gm4_bas_arms_detect"],height:2,width:0.51}
execute if score $size gm4_bas_data matches 1 run summon minecraft:interaction ~ ~-0.01 ~ {Tags:["smithed.entity","smithed.strict","gm4_bas_arms_detect"],height:1,width:0.251}

# start check loop to remove interaction
schedule function gm4_better_armour_stands:toggle/arms/check 16t
