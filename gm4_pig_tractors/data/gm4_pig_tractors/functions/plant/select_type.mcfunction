# Decides which seed to use upon replanting
# @s = player on a pig tractor
# at planting location of seed
# run from functions in gm4_pig_tractors:till/blocks/

# fake player for if-else
scoreboard players set $pulled_seeds gm4_pig_tractors 0

# check if player is holding seeds in mainhand
execute if predicate gm4_pig_tractors:player/equipment/mainhand/seeds run function gm4_pig_tractors:plant/use_mainhand_seeds

# check if player is holding seeds in offhand
execute if score $pulled_seeds gm4_pig_tractors matches 0 if predicate gm4_pig_tractors:player/equipment/offhand/seeds run function gm4_pig_tractors:plant/use_offhand_seeds

# otherwise, use predefined order
execute if score $pulled_seeds gm4_pig_tractors matches 0 run function gm4_pig_tractors:plant/use_predefined_order
