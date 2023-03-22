# damage player according to score
# @s = player that is taking damage
# at world spawn
# run from armor/modifier/type/guardian/damage_calc 
# run from weapon/modifier/delay/explode_player

# lower player's health to their new health
execute if score $remove_health gm4_ce_data matches 512.. run damage @s 512 generic
execute if score $remove_health gm4_ce_data matches 512.. run scoreboard players remove $remove_health gm4_ce_data 512
execute if score $remove_health gm4_ce_data matches 256.. run damage @s 256 generic
execute if score $remove_health gm4_ce_data matches 256.. run scoreboard players remove $remove_health gm4_ce_data 256
execute if score $remove_health gm4_ce_data matches 128.. run damage @s 128 generic
execute if score $remove_health gm4_ce_data matches 128.. run scoreboard players remove $remove_health gm4_ce_data 128
execute if score $remove_health gm4_ce_data matches 64.. run damage @s 64 generic
execute if score $remove_health gm4_ce_data matches 64.. run scoreboard players remove $remove_health gm4_ce_data 64
execute if score $remove_health gm4_ce_data matches 32.. run damage @s 32 generic
execute if score $remove_health gm4_ce_data matches 32.. run scoreboard players remove $remove_health gm4_ce_data 32
execute if score $remove_health gm4_ce_data matches 16.. run damage @s 16 generic
execute if score $remove_health gm4_ce_data matches 16.. run scoreboard players remove $remove_health gm4_ce_data 16
execute if score $remove_health gm4_ce_data matches 8.. run damage @s 8 generic
execute if score $remove_health gm4_ce_data matches 8.. run scoreboard players remove $remove_health gm4_ce_data 8
execute if score $remove_health gm4_ce_data matches 4.. run damage @s 4 generic
execute if score $remove_health gm4_ce_data matches 4.. run scoreboard players remove $remove_health gm4_ce_data 4
execute if score $remove_health gm4_ce_data matches 2.. run damage @s 2 generic
execute if score $remove_health gm4_ce_data matches 2.. run scoreboard players remove $remove_health gm4_ce_data 2
execute if score $remove_health gm4_ce_data matches 1.. run damage @s 1 generic
