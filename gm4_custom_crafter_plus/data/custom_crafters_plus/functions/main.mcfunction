
# destroy
execute as @e[tag=gm4_craftingstand,type=armor_stand] at @s unless block ~ ~ ~ chest run function custom_crafters_plus:destroy

# create
execute as @e[type=item,nbt={Item:{id:"minecraft:diamond_block"}}] at @s if block ~ ~-0.3 ~ crafting_table run function custom_crafters_plus:create

# recipe validity check
execute as @e[tag=gm4_craftingstand,type=armor_stand] at @s if block ~ ~ ~ chest run function #custom_crafters_plus:recipe_check2

execute as @e[tag=gm4_craftingstand,type=armor_stand] at @s if block ~ ~ ~ chest run function #custom_crafters_plus:recipe_check
