# pick underground buff
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/base

execute store result score $buff_picked gm4_mu_data run random value 1..6

execute if score $buff_picked gm4_mu_data matches 1 run effect give @s resistance infinite 0
execute if score $buff_picked gm4_mu_data matches 2 run effect give @s speed infinite 0
execute if score $buff_picked gm4_mu_data matches 3 run effect give @s regeneration infinite 0
execute if score $buff_picked gm4_mu_data matches 4 run function gm4_monsters_unbound:mob/init/mob_type/zombie/underground/offhand_weapon
execute if score $buff_picked gm4_mu_data matches 5 run function gm4_monsters_unbound:mob/init/mob_type/zombie/equip_shield
execute if score $buff_picked gm4_mu_data matches 6 run function gm4_monsters_unbound:mob/init/mob_type/zombie/underground/replace_with_skeleton
