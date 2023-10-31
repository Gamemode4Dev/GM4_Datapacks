# damage player if above half health
# @s = player wearing half armour
# at unspecified
# run from armor/modifier/type/half/apply

scoreboard players operation $remove_health gm4_ce_data = @s gm4_ce_health
scoreboard players operation $remove_health gm4_ce_data -= $half_health gm4_ce_data

execute if score $remove_health gm4_ce_data matches 2.. run damage @s 2 out_of_world
execute if score $remove_health gm4_ce_data matches 1 run damage @s 1 out_of_world
