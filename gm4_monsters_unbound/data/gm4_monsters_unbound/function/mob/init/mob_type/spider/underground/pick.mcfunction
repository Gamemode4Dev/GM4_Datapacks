# pick underground buff
# @s = spider
# at @s
# run from mob/init/mob_type/spider/spider

execute store result score $buff_picked gm4_mu_data run random value 1..3

execute if score $buff_picked gm4_mu_data matches 1 run effect give @s invisibility infinite 0
execute if score $buff_picked gm4_mu_data matches 2 run function gm4_monsters_unbound:mob/init/mob_type/spider/gargantuan
execute if score $buff_picked gm4_mu_data matches 3 run function gm4_monsters_unbound:mob/init/mob_type/spider/underground/replace_with_cave_spider
