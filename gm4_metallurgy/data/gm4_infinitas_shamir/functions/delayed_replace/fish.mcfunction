


execute if entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand=true}] run say mainhand replace fish bucket
execute if entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand=true}] run say offhand replace fish bucket

scoreboard players reset @s gm4_infinitas_success_check

execute if entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand=true}] run function gm4_infinitas_shamir:delayed_replace/fish/mainhand_check
execute unless score @s gm4_infinitas_success_check matches 1 if entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand=true}] run function gm4_infinitas_shamir:delayed_replace/fish/offhand_check
# item replace entity @s[advancements={gm4_infinitas_shamir:water/place_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/water] weapon.offhand with water_bucket{display:{Lore:['{"italic":false,"color":"#467A1B","translate":"%1$s%3427655$s","with":["Curie\'s Bismium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Infinitas",{"translate":"item.gm4.shamir.infinitas"}]}']},CustomModelData:3420125,gm4_metallurgy:{metal:{type:"curies_bismium"},custom_model_data:3420125,has_shamir:1b,active_shamir:"infinitas",skull_owner:"[Drop to Fix Item] gm4_infinitas_shamir:band/v0"}}

advancement revoke @s only gm4_infinitas_shamir:water/pickup_mainhand
advancement revoke @s only gm4_infinitas_shamir:water/pickup_offhand

tag @s remove gm4_infinitas_delay_replace_fish
