# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item (depending on red/blue fire)
execute unless score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.poison","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (0:32)","color":"red","italic":false}]']},HideFlags:32,Potion:"poison",CustomPotionEffects:[{Id:19,Amplifier:3,Duration:640}]}}}
execute if score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.poison","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (0:32)","color":"red","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Soulution of Poison",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.potion.poison"}]],"italic":false}'},HideFlags:32,Potion:"poison",CustomPotionEffects:[{Id:19,Amplifier:3,Duration:640}]}}}

# visuals
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
fill ~1 ~ ~-1 ~1 ~1 ~-1 cobweb keep
execute if block ~1 ~ ~-1 air run summon cave_spider ~1 ~ ~-1
fill ~-1 ~ ~ ~-1 ~ ~ cobweb keep
execute if block ~-1 ~ ~ air run summon cave_spider ~-1 ~ ~
fill ~-1 ~ ~-1 ~-1 ~1 ~ cobweb keep
execute if block ~-1 ~1 ~ air run summon cave_spider ~-1 ~1 ~
fill ~-1 ~ ~-1 ~-1 ~1 ~ cobweb keep
execute if block ~-1 ~1 ~ air run summon cave_spider ~-1 ~1 ~
fill ~1 ~1 ~1 ~1 ~1 ~1 cobweb keep
scoreboard players set recipe_success gm4_zc_data 1
