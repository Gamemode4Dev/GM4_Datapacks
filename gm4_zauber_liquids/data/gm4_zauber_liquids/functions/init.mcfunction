scoreboard objectives add gm4_zl_warp_cx dummy "gm4_zauber_liquids_warp_cx"
scoreboard objectives add gm4_zl_warp_cy dummy "gm4_zauber_liquids_warp_cy"
scoreboard objectives add gm4_zl_warp_cz dummy "gm4_zauber_liquids_warp_cz"
scoreboard objectives add gm4_zl_warp_cd dummy "gm4_zauber_liquids_warp_cd"
scoreboard players set #2 gm4_lt_value 2

#declare storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole

execute unless score zauber_liquids gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Liquids"}
execute unless score zauber_liquids gm4_earliest_version < zauber_liquids gm4_modules run scoreboard players operation zauber_liquids gm4_earliest_version = zauber_liquids gm4_modules
scoreboard players set zauber_liquids gm4_modules 1



#$moduleUpdateList
