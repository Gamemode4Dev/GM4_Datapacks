
execute store result score $curr_health gm4_ce_data run data get entity @s Health 10
execute store result score $max_health gm4_ce_data run attribute @s generic.max_health get 10
execute if score $curr_health gm4_ce_data < $max_health gm4_ce_data run tag @s add gm4_ce_target
