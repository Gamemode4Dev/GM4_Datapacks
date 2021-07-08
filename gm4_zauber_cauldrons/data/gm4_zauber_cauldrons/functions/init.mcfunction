scoreboard objectives add gm4_zc_chorus dummy
scoreboard objectives add gm4_zc_data dummy
scoreboard objectives add gm4_zc_deaths deathCount
scoreboard objectives add gm4_zc_flowers dummy
scoreboard objectives add gm4_zc_fullness dummy
scoreboard objectives add gm4_zc_id dummy
scoreboard objectives add gm4_zc_rabtarget dummy
function gm4_zauber_cauldrons:recipes/flowers/initiate_flower_types
function gm4_zauber_cauldrons:recipes/chorus/initiate_chorus_amounts
scoreboard players set #modulo gm4_zc_fullness 3

# This module includes the gm4_forceload library. If you didn't get this pack from our website, make sure you have the gm4_forceload library installed!
# This module includes the gm4_player_heads library. If you didn't get this pack from our website, make sure you have the gm4_player_heads library installed!

# register skulls
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/resistance/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/resistance/v1",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODc4ODY4MjcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS83MmRkMTkxZDgxYzg4NDUzYzVlM2JjMWJlMjFkYjVhMTkyZDUyNmI3MTg2YjJmNjk0ZjI4Y2JkZmNjYzYyYzNhIn19fQ==',item:{CustomModelData:10,gm4_zauber_cauldrons:{item:"crystal",type:"resistance"},HideFlags:1,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Crystal of Resistance",{"translate":"item.gm4.zauber_crystal.resistance"}]}'}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/fire_resistance/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/fire_resistance/v1",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODgyNDc2MDMsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81OGQ4ZWZjODJlMzQyYmI4MTRmYTc3YTZlNzFmMzNiMGU1YTVkOGI1ZmJiOTI0N2YxOTQ2ZjBmZWI0ODMzNyJ9fX0=',item:{CustomModelData:11,gm4_zauber_cauldrons:{item:"crystal",type:"fire_resistance"},HideFlags:1,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Crystal of Fire Resistance",{"translate":"item.gm4.zauber_crystal.fire_resistance"}]}'}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/speed/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/speed/v1",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODg0MTI0MTksInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zNDY0MTcxY2Y2ZTJiOWMwYTI1MjRhZGYzZGI0MjdmNWQ1NzdiM2E2YWFmOTIyNDlmZTI4MWM3YzMwNDdmZSJ9fX0=',item:{CustomModelData:12,gm4_zauber_cauldrons:{item:"crystal",type:"speed"},HideFlags:1,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Crystal of Speed",{"translate":"item.gm4.zauber_crystal.speed"}],"italic":false}'}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/regeneration/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/regeneration/v1",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODYzMDA0MTcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lNzZmNDQ5MTI2MjQxOTM2ZDE3ODZhNDAyZGY2ZjQ2NWU1ZTdiMjhlZWQzNWFiNzY3MWYwZDI2YjJjZTZlMyJ9fX0=',item:{CustomModelData:13,gm4_zauber_cauldrons:{item:"crystal",type:"regeneration"},HideFlags:1,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Crystal of Regeneration",{"translate":"item.gm4.zauber_crystal.regeneration"}]}'}}}

# register item nbt
# TODO: potentially move these to their recipe checks and run before recipes to be temper-safe
data modify storage gm4_zauber_cauldrons:blueprint/item/multi_sip gm4_zauber_cauldrons.bottle set value {sips:9,size:9,multi_use:1b}
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/boots gm4_zauber_cauldrons set value {item:"zauber_armor",type:"boots"}
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/chestplate gm4_zauber_cauldrons set value {item:"zauber_armor",type:"chestplate"}
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/helmet gm4_zauber_cauldrons set value {item:"zauber_armor",type:"helmet"}
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/leggings gm4_zauber_cauldrons set value {item:"zauber_armor",type:"leggings"}
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/attribute/attack_boost CustomModelData set value 3
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/attribute/health_boost CustomModelData set value 2
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/attribute/knockback_resistance CustomModelData set value 5
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/attribute/speed_boost CustomModelData set value 4

execute unless score zauber_cauldrons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Cauldrons"}
scoreboard players set zauber_cauldrons gm4_modules 1

schedule function gm4_zauber_cauldrons:main 1t

#$moduleUpdateList
