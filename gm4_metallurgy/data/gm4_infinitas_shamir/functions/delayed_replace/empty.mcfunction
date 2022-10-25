#
#
#
#

item replace entity @s[advancements={gm4_infinitas_shamir:empty/pickup_mainhand=true},predicate=gm4_infinitas_shamir:mainhand/after/empty] weapon.mainhand with bucket{display:{Lore:['{"italic":false,"color":"#467A1B","translate":"%1$s%3427655$s","with":["Curie\'s Bismium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Infinitas",{"translate":"item.gm4.shamir.infinitas"}]}']},CustomModelData:3420125,gm4_metallurgy:{metal:{type:"curies_bismium"},custom_model_data:3420125,has_shamir:1b,active_shamir:"infinitas",skull_owner:"[Drop to Fix Item] gm4_infinitas_shamir:band/v0"}}
item replace entity @s[advancements={gm4_infinitas_shamir:empty/pickup_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/empty] weapon.offhand with bucket{display:{Lore:['{"italic":false,"color":"#467A1B","translate":"%1$s%3427655$s","with":["Curie\'s Bismium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Infinitas",{"translate":"item.gm4.shamir.infinitas"}]}']},CustomModelData:3420125,gm4_metallurgy:{metal:{type:"curies_bismium"},custom_model_data:3420125,has_shamir:1b,active_shamir:"infinitas",skull_owner:"[Drop to Fix Item] gm4_infinitas_shamir:band/v0"}}

# clean up
tag @s remove gm4_infinitas_delay_replace_empty
advancement revoke @s only gm4_infinitas_shamir:empty/pickup_mainhand
advancement revoke @s only gm4_infinitas_shamir:empty/pickup_offhand
