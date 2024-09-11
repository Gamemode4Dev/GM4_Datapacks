# run when a players logs back in
# @s = player relogging
# at @s
advancement revoke @s only gm4_combat_expanded:relog

scoreboard players reset @s gm4_ce_relog

# check if clocks need to be restarted
execute unless score $keep_tick.burn gm4_ce_keep_tick matches 1 if score @s gm4_ce_burning.duration matches 1.. run schedule function gm4_combat_expanded:clocks/temp/burn 1t
execute unless score $keep_tick.lightning gm4_ce_keep_tick matches 1 if score @s gm4_ce_lightning_charge matches 1.. run schedule function gm4_combat_expanded:clocks/temp/lightning 1t
execute unless score $keep_tick.delay gm4_ce_keep_tick matches 1 if entity @s[tag=gm4_ce_delay_active] run schedule function gm4_combat_expanded:clocks/temp/delay 1t
execute unless score $keep_tick.archer gm4_ce_keep_tick matches 1 if entity @s[tag=gm4_ce_wearing_archer] run schedule function gm4_combat_expanded:clocks/temp/archer 1t
