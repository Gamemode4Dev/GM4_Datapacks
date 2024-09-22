# apply combat regeneration reduction

scoreboard players set $regen_perc_reduction gm4_aa_data 100
scoreboard players operation $regen_perc_reduction gm4_aa_data *= $regen_speed gm4_aa_data
scoreboard players add $regen_speed gm4_aa_data 100
scoreboard players operation $regen_perc_reduction gm4_aa_data /= $regen_speed gm4_aa_data

scoreboard players operation $regen_timer_reduction gm4_aa_data = $set gm4_sr_combat_regen_timer
scoreboard players operation $regen_timer_reduction gm4_aa_data *= $regen_perc_reduction gm4_aa_data
scoreboard players operation $regen_timer_reduction gm4_aa_data /= #100 gm4_aa_data
scoreboard players operation $set gm4_sr_combat_regen_timer -= $regen_timer_reduction gm4_aa_data
