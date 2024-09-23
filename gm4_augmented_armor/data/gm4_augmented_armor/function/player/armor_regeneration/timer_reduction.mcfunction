# apply armor regeneration reduction

scoreboard players set $recharge_perc_reduction gm4_aa_data 100
scoreboard players operation $recharge_perc_reduction gm4_aa_data *= $armor_recharge gm4_aa_data
scoreboard players add $armor_recharge gm4_aa_data 100
scoreboard players operation $recharge_perc_reduction gm4_aa_data /= $armor_recharge gm4_aa_data

scoreboard players operation $recharge_timer_reduction gm4_aa_data = $set gm4_sr_armor_reduction_timer
scoreboard players operation $recharge_timer_reduction gm4_aa_data *= $recharge_perc_reduction gm4_aa_data
scoreboard players operation $recharge_timer_reduction gm4_aa_data /= #100 gm4_aa_data
scoreboard players operation $set gm4_sr_armor_reduction_timer -= $recharge_timer_reduction gm4_aa_data
