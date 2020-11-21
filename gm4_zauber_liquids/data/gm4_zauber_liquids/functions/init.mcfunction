scoreboard objectives add gm4_zl_data dummy "gm4_zauber_liquids_data"
scoreboard objectives add gm4_zl_warp_cx dummy "gm4_zauber_liquids_warp_cx"
scoreboard objectives add gm4_zl_warp_cy dummy "gm4_zauber_liquids_warp_cy"
scoreboard objectives add gm4_zl_warp_cz dummy "gm4_zauber_liquids_warp_cz"
scoreboard objectives add gm4_zl_warp_cd dummy "gm4_zauber_liquids_warp_cd"
scoreboard players set divisor gm4_zl_data 2

execute unless score zauber_liquids gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Liquids"}
scoreboard players set zauber_liquids gm4_modules 1

#$moduleUpdateList
