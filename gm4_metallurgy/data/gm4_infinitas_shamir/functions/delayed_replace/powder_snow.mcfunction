#
#
#
#
say replace powder snow bucket

item replace entity @s[advancements={gm4_infinitas_shamir:powder_snow/place_mainhand=true},predicate=gm4_infinitas_shamir:mainhand/after/use_bucket] weapon.mainhand with powder_snow_bucket{display:{Lore:['{"italic":false,"color":"#467A1B","translate":"%1$s%3427655$s","with":["Curie\'s Bismium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Infinitas",{"translate":"item.gm4.shamir.infinitas"}]}']},CustomModelData:3420125,gm4_metallurgy:{metal:{type:"curies_bismium"},custom_model_data:3420125,has_shamir:1b,active_shamir:"infinitas",skull_owner:"[Drop to Fix Item] gm4_infinitas_shamir:band/v0"}}
item replace entity @s[advancements={gm4_infinitas_shamir:powder_snow/place_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/use_bucket] weapon.offhand with powder_snow_bucket{display:{Lore:['{"italic":false,"color":"#467A1B","translate":"%1$s%3427655$s","with":["Curie\'s Bismium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Infinitas",{"translate":"item.gm4.shamir.infinitas"}]}']},CustomModelData:3420125,gm4_metallurgy:{metal:{type:"curies_bismium"},custom_model_data:3420125,has_shamir:1b,active_shamir:"infinitas",skull_owner:"[Drop to Fix Item] gm4_infinitas_shamir:band/v0"}}

advancement revoke @s only gm4_infinitas_shamir:powder_snow/place_mainhand
advancement revoke @s only gm4_infinitas_shamir:powder_snow/place_offhand

tag @s remove gm4_infinitas_delay_replace_powder_snow
