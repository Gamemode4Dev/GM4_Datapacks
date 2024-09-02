# check which elite has died
# @s = item dropped from killed elite
# at @s
# run from check_item

execute store result score $elite_type gm4_mu_data run data get entity @s Item.components."minecraft:custom_data".gm4_mu_elite_on_death.id
execute if score $elite_type gm4_mu_data matches 1 run function gm4_monsters_unbound:mob/process/elite/glacial/death
execute if score $elite_type gm4_mu_data matches 2 positioned ~ ~1.75 ~ summon item_display run function gm4_monsters_unbound:mob/process/elite/vorpal/init_fear_cloud
execute if score $elite_type gm4_mu_data matches 3 positioned ~ ~0.25 ~ run function gm4_monsters_unbound:mob/process/elite/splitting/zombie
execute if score $elite_type gm4_mu_data matches 4 positioned ~ ~0.25 ~ run function gm4_monsters_unbound:mob/process/elite/splitting/skeleton
execute if score $elite_type gm4_mu_data matches 5 run function gm4_monsters_unbound:mob/process/elite/volatile/death

kill @s
