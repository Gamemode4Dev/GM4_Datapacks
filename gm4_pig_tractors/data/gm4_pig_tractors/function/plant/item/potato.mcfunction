# uses potato from the players inventory and plants it
# @s = player requesting potato planting
# at item planting location
# run from gm4_pig_tractors:plant/use_mainhand_seeds and gm4_pig_tractors:plant/use_offhand_seeds and gm4_pig_tractors:plant/use_predefined_order and gm4_pig_tractors:harvest/block/
# sets fake player flag $planted_successfully in gm4_pig_tractors to 1 if planting was successful, to 0 otherwise

# remove seed from player
execute if entity @s[gamemode=!creative] store success score $planted_successfully gm4_pig_tractors run clear @s potato 1
execute if entity @s[gamemode=creative] store success score $planted_successfully gm4_pig_tractors run clear @s potato 0

# plant if player had seed
execute if score $planted_successfully gm4_pig_tractors matches 1 run function gm4_pig_tractors:plant/block/potatoes
