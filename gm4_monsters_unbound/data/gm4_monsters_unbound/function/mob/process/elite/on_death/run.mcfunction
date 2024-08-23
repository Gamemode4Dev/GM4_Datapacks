
execute store result score $elite_type gm4_mu_data run data get entity @s Item.components."minecraft:custom_data".gm4_mu_elite_on_death.id
execute if score $elite_type gm4_mu_data matches 1 run function gm4_monsters_unbound:mob/process/elite/glacial/death
execute if score $elite_type gm4_mu_data matches 2 run function gm4_monsters_unbound:mob/process/elite/vorpal/death
execute if score $elite_type gm4_mu_data matches 3 positioned ~ ~-1.5 ~ run function gm4_monsters_unbound:mob/process/elite/splitting/zombie
execute if score $elite_type gm4_mu_data matches 4 positioned ~ ~-1.5 ~ run function gm4_monsters_unbound:mob/process/elite/splitting/skeleton

kill @s

