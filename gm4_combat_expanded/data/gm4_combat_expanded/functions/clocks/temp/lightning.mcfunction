# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from armor/modifier/type/spark/activate
# schedule from weapon/modifier/lightning/add_score
# schedule from here

scoreboard players set $keep_tick.lightning gm4_ce_keep_tick 0
execute as @e[scores={gm4_ce_lightning_charge=1..}] at @s run function gm4_combat_expanded:weapon/modifier/lightning/tick
execute if score $keep_tick.lightning gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/lightning 1t
