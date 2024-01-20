scoreboard objectives add gm4_entity_version dummy
scoreboard objectives add gm4_zc_bottled_vex_escape_timer dummy
scoreboard objectives add gm4_zc_chorus dummy
scoreboard objectives add gm4_zc_crystal dummy
scoreboard objectives add gm4_zc_data dummy
scoreboard objectives add gm4_zc_flowers dummy
scoreboard objectives add gm4_zc_fullness dummy
scoreboard objectives add gm4_zc_id dummy
scoreboard objectives add gm4_zc_liquid_level dummy
scoreboard objectives add gm4_zc_moon_phase dummy
scoreboard objectives add gm4_zc_no_explode dummy
scoreboard objectives add gm4_zc_magicol_painter_timer dummy
scoreboard objectives add gm4_zc_rabtarget dummy
# assign lucky/poisonous flowers, unless this was done before
execute unless score $required_flowers gm4_zc_flowers matches -2147483648..2147483647 run function gm4_zauber_cauldrons:recipes/flowers/initiate_flower_types
# assign chorus amounts, unless this was done before. The latter score check without the $ and the scoreboard operation are required on old worlds.
execute if score required_popped_chorus_fruit gm4_zc_chorus matches -2147483648..2147483647 run scoreboard players operation $required_popped_chorus_fruit gm4_zc_chorus = required_popped_chorus_fruit gm4_zc_chorus
execute unless score $required_total gm4_zc_chorus matches -2147483648..2147483647 unless score required_total gm4_zc_chorus matches -2147483648..2147483647 run function gm4_zauber_cauldrons:recipes/chorus/initiate_chorus_amounts
# assign moon phase offset
execute unless score $magicol_offset gm4_zc_moon_phase matches -2147483648..2147483647 run function gm4_zauber_cauldrons:recipes/magicol/initiate_moon_phase_offset
scoreboard players set #modulo gm4_zc_fullness 3
scoreboard players set #8 gm4_zc_moon_phase 8
scoreboard players set #256 gm4_zc_moon_phase 256
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

# register skulls
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/instant_damage"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/instant_damage",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/instant_damage',loot_table:'gm4_zauber_cauldrons:items/crystals/instant_damage'}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/instant_health"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/instant_health",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/instant_health',loot_table:'gm4_zauber_cauldrons:items/crystals/instant_health'}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/jump_boost"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/jump_boost",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/jump_boost',loot_table:'gm4_zauber_cauldrons:items/crystals/jump_boost'}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/poison"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/poison",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/poison',loot_table:'gm4_zauber_cauldrons:items/crystals/poison'}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/regeneration"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/regeneration",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/regeneration',loot_table:'gm4_zauber_cauldrons:items/crystals/regeneration'}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/speed"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/speed",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/speed',loot_table:'gm4_zauber_cauldrons:items/crystals/speed'}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/strength"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/strength",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/strength',loot_table:'gm4_zauber_cauldrons:items/crystals/strength'}

# module data version
execute if score zauber_cauldrons gm4_modules matches ..16030 unless score $data_version gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:cauldron/structure/update/search_for_outdated_markers
scoreboard players set $data_version gm4_zc_data 1

# website maintained module version
execute unless score zauber_cauldrons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Cauldrons"}
execute unless score zauber_cauldrons gm4_earliest_version < zauber_cauldrons gm4_modules run scoreboard players operation zauber_cauldrons gm4_earliest_version = zauber_cauldrons gm4_modules
scoreboard players set zauber_cauldrons gm4_modules 1

# start core functionality
schedule function gm4_zauber_cauldrons:main 1t

# start vex in a bottle release meachanism
schedule function gm4_zauber_cauldrons:cauldron/extra_items/process_bottled_vex_items 2t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 5366.749169930782 ~ {CustomName:'"gm4_zauber_cauldrons_guide"',Tags:["gm4_guide"],data:{type:"module",id:"zauber_cauldrons",page_count:14,line_count:1,module_name:"Zauber Cauldrons"}}

#$moduleUpdateList
