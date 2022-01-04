scoreboard objectives add gm4_zl_warp_cx dummy "gm4_zauber_liquids_warp_cx"
scoreboard objectives add gm4_zl_warp_cy dummy "gm4_zauber_liquids_warp_cy"
scoreboard objectives add gm4_zl_warp_cz dummy "gm4_zauber_liquids_warp_cz"
scoreboard objectives add gm4_zl_warp_cd dummy "gm4_zauber_liquids_warp_cd"
scoreboard players set #2 gm4_lt_value 2

#declare storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole

execute unless score zauber_liquids gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Liquids"}
scoreboard players set zauber_liquids gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 5366.749174868547 ~ {CustomName:'"gm4_zauber_liquids_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"zauber_liquids",page_count:1,line_count:1,module_name:"Zauber Liquids"}}

#$moduleUpdateList
