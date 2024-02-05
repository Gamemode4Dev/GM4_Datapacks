# run when a players logs back in
# @s = player relogging
# at @s
advancement revoke @s only gm4_combat_expanded:relog

scoreboard players reset @s gm4_ce_relog

# check if clocks need to be restarted
execute unless score $keep_tick.lightning gm4_ce_data matches 1 if score @s gm4_ce_lightning_charge matches 1.. run schedule function gm4_combat_expanded:weapon/modifier/lightning/clock 1t
execute unless score $keep_tick.delay gm4_ce_data matches 1 if entity @s[tag=gm4_cd_delay_active] run schedule function gm4_combat_expanded:weapon/modifier/delay/clock 1t
execute unless score $keep_tick.archer gm4_ce_data matches 1 if entity @s[tag=gm4_ce_wearing_archer] run schedule function gm4_combat_expanded:armor/modifier/type/archer/clock 1t
