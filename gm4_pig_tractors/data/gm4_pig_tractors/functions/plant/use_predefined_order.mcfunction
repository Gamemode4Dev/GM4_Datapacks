# tries to use seed from the inventory using a alphabetical order
# @s = player on pig tractor queued for replanting
# at location of seeds to be planted
# run from gm4_pig_tractors:plant/select_type

function gm4_pig_tractors:plant/item/beetroot_seeds
execute if score $planted_successfully gm4_pig_tractors matches 0 run function gm4_pig_tractors:plant/item/carrot
execute if score $planted_successfully gm4_pig_tractors matches 0 run function gm4_pig_tractors:plant/item/potato
execute if score $planted_successfully gm4_pig_tractors matches 0 run function gm4_pig_tractors:plant/item/wheat_seeds
