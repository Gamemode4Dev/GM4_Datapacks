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
# TODO automate skull registery, AND give crystals a random unstackability number when spawned via the loot table
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/instant_damage/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/instant_damage/v1",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/instant_damage/v1',value:'$crystal/instant_damage',unstackable:1b,item:{CustomModelData:3420054,gm4_zauber_cauldrons:{item:"crystal",type:"instant_damage"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.instant_damage","fallback":"Crystal of Harming"}',Lore:['{"italic":false,"color":"red","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.instant_damage"},{"translate":"potion.potency.1"}]}']}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/instant_health/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/instant_health/v1",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/instant_health/v1',value:'$crystal/instant_health',item:{CustomModelData:3420055,gm4_zauber_cauldrons:{item:"crystal",type:"instant_health"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.instant_health","fallback":"Crystal of Healing"}',Lore:['{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.instant_health"},{"translate":"potion.potency.1"}]}', '{"italic":false,"color":"red","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.nausea"},{"translate":"potion.potency.0"}]}']}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/jump_boost/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/jump_boost/v1",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/jump_boost/v1',value:'$crystal/jump_boost',unstackable:1b,item:{CustomModelData:3420056,gm4_zauber_cauldrons:{item:"crystal",type:"jump_boost"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.jump_boost","fallback":"Crystal of Leaping"}',Lore:['{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.jump_boost"},{"translate":"potion.potency.1"}]}']}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/poison/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/poison/v1",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/poison/v1',value:'$crystal/poison',unstackable:1b,item:{CustomModelData:3420057,gm4_zauber_cauldrons:{item:"crystal",type:"poison"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.poison","fallback":"Crystal of Poison"}',Lore:['{"italic":false,"color":"red","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.poison"},{"translate":"potion.potency.1"}]}']}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/regeneration/v2"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/regeneration/v2",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/regeneration/v2',value:'$crystal/regeneration',item:{CustomModelData:3420013,gm4_zauber_cauldrons:{item:"crystal",type:"regeneration"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.regeneration","fallback":"Crystal of Regeneration"}',Lore:['{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.regeneration"},{"translate":"potion.potency.1"}]}']}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/speed/v2"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/speed/v2",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/speed/v2',value:'$crystal/speed',unstackable:1b,item:{CustomModelData:3420012,gm4_zauber_cauldrons:{item:"crystal",type:"speed"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.speed","fallback":"Crystal of Swiftness"}',Lore:['{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.speed"},{"translate":"potion.potency.1"}]}', '{"italic":false,"color":"red","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.weakness"},{"translate":"potion.potency.0"}]}', '{"text":""}', '{"italic":false,"color":"dark_purple","translate":"potion.whenDrank"}', '{"italic":false,"color":"blue","translate":"attribute.modifier.plus.1","with":["40",{"translate":"attribute.name.generic.movement_speed"}]}', '{"italic":false,"color":"red","translate":"attribute.modifier.take.0","with":["4",{"translate":"attribute.name.generic.attack_damage"}]}']}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/strength/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/strength/v1",name:'[Drop to Fix Item] gm4_zauber_cauldrons:crystal/strength/v1',value:'$crystal/strength',unstackable:1b,item:{CustomModelData:3420058,gm4_zauber_cauldrons:{item:"crystal",type:"strength"},display:{Name:'{"italic":false,"translate":"item.gm4.zauber_cauldrons.crystal.strength","fallback":"Crystal of Strength"}',Lore:['{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.strength"},{"translate":"potion.potency.1"}]}', '{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"effect.minecraft.fire_resistance"},{"translate":"potion.potency.0"}]}', '{"text":""}', '{"italic":false,"color":"dark_purple","translate":"potion.whenDrank"}', '{"italic":false,"color":"blue","translate":"attribute.modifier.plus.0","with":["6",{"translate":"attribute.name.generic.attack_damage"}]}']}}}

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
