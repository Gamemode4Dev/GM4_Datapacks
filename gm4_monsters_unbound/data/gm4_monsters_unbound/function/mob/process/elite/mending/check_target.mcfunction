# check if this entity is a valid target to be healed
# @s = undead near mending elite
# at @s
# run from mob/process/elite/mending/process

execute store result score $curr_health gm4_mu_data run data get entity @s Health 10
execute store result score $max_health gm4_mu_data run attribute @s minecraft:max_health get 10
# remove a slight amount from max_health to fix floating point errors
scoreboard players remove $max_health gm4_mu_data 2
execute if score $curr_health gm4_mu_data < $max_health gm4_mu_data run tag @s add gm4_mu_target
