# tries to use seed from the inventory using a alphabetical order
# @s = player on pig tractor queued for replanting
# at location of seeds to be planted
# run from gm4_pig_tractors:plant/select_type

execute if items entity @s gm4_pig_tractors:player_inventory minecraft:beetroot_seeds run return run function gm4_pig_tractors:plant/block/beetroot_seeds
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:carrot run return run function gm4_pig_tractors:plant/block/carrot
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:potato run return run function gm4_pig_tractors:plant/block/potato
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:wheat_seeds run return run function gm4_pig_tractors:plant/block/wheat_seeds
