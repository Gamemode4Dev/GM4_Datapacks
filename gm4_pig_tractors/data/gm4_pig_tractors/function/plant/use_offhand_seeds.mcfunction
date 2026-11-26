# reads item id from offhand and plants seeds depending on type
# @s = player on pig tractor queued for replanting
# at location of seeds to be planted
# run from gm4_pig_tractors:plant/select_type

execute if items entity @s weapon.offhand minecraft:beetroot_seeds run function gm4_pig_tractors:plant/block/beetroot_seeds
execute if items entity @s weapon.offhand minecraft:carrot run function gm4_pig_tractors:plant/block/carrot
execute if items entity @s weapon.offhand minecraft:potato run function gm4_pig_tractors:plant/block/potato
execute if items entity @s weapon.offhand minecraft:wheat_seeds run function gm4_pig_tractors:plant/block/wheat_seeds
