scoreboard objectives add gm4_zc_data dummy "gm4_zauber_cauldrons_data"
scoreboard objectives add gm4_zc_flowers dummy "gm4_zauber_cauldrons_flowers"
scoreboard objectives add gm4_zc_chorus dummy "gm4_zauber_cauldrons_chorus"
scoreboard objectives add gm4_zc_fullness dummy "gm4_zauber_cauldrons_fullness"
scoreboard objectives add gm4_zc_deaths deathCount "gm4_zauber_cauldrons_deaths"
scoreboard objectives add gm4_zc_id dummy "gm4_zauber_cauldrons_sips"
function gm4_zauber_cauldrons:recipes/flowers/initiate_flower_types
function gm4_zauber_cauldrons:recipes/chorus/initiate_chorus_amounts
scoreboard players set modulo gm4_zc_fullness 3

# This module includes the gm4_forceload library. If you didn't get this pack from our website, make sure you have the gm4_forceload library installed!
# This module includes the gm4_player_heads library. If you didn't get this pack from our website, make sure you have the gm4_player_heads library installed!

# register skulls
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/resistance/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/resistance/v0",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODc4ODY4MjcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS83MmRkMTkxZDgxYzg4NDUzYzVlM2JjMWJlMjFkYjVhMTkyZDUyNmI3MTg2YjJmNjk0ZjI4Y2JkZmNjYzYyYzNhIn19fQ==',item:{CustomModelData:10,gm4_zauber_cauldrons:{item:"crystal",type:"resistance"},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Resistance",{"translate":"item.gm4.zauber_crystal.resistance"}],"italic":false}'}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/fire_resistance/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/fire_resistance/v0",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODgyNDc2MDMsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81OGQ4ZWZjODJlMzQyYmI4MTRmYTc3YTZlNzFmMzNiMGU1YTVkOGI1ZmJiOTI0N2YxOTQ2ZjBmZWI0ODMzNyJ9fX0=',item:{CustomModelData:11,gm4_zauber_cauldrons:{item:"crystal",type:"fire_resistance"},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Fire Resistance",{"translate":"item.gm4.zauber_crystal.fire_resistance"}],"italic":false}'}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/speed/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/speed/v0",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODg0MTI0MTksInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zNDY0MTcxY2Y2ZTJiOWMwYTI1MjRhZGYzZGI0MjdmNWQ1NzdiM2E2YWFmOTIyNDlmZTI4MWM3YzMwNDdmZSJ9fX0=',item:{CustomModelData:12,gm4_zauber_cauldrons:{item:"crystal",type:"speed"},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Speed",{"translate":"item.gm4.zauber_crystal.speed"}],"italic":false}'}}}
execute unless data storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/regeneration/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_zauber_cauldrons:crystal/regeneration/v0",value:'eyJ0aW1lc3RhbXAiOjE0NzY4ODYzMDA0MTcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lNzZmNDQ5MTI2MjQxOTM2ZDE3ODZhNDAyZGY2ZjQ2NWU1ZTdiMjhlZWQzNWFiNzY3MWYwZDI2YjJjZTZlMyJ9fX0=',item:{CustomModelData:13,gm4_zauber_cauldrons:{item:"crystal",type:"regeneration"},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Regeneration",{"translate":"item.gm4.zauber_crystal.regeneration"}],"italic":false}'}}}

execute unless score zauber_cauldrons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Zauber Cauldrons"}
scoreboard players set zauber_cauldrons gm4_modules 1

schedule function gm4_zauber_cauldrons:main 1t

#$moduleUpdateList
