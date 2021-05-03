# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item (depending on red/blue fire)
execute unless score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.strength","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.0","with":["12",{"translate":"attribute.name.generic.attack_damage"}],"color":"blue","italic":false}']},HideFlags:32,Potion:"strength",CustomPotionEffects:[{Id:5,Amplifier:3,Duration:1800}]}}}
execute if score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.strength","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.0","with":["12",{"translate":"attribute.name.generic.attack_damage"}],"color":"blue","italic":false}'],Name:'{"translate":"%1$s%3427655$s","with":["Soulution of Strength",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.potion.strength"}]],"italic":false}'},HideFlags:32,Potion:"strength",CustomPotionEffects:[{Id:5,Amplifier:3,Duration:1800}]}}}

# visuals
fill ~-1 ~ ~-1 ~1 ~1 ~1 fire replace #gm4:air
playsound item.firecharge.use block @a[distance=..16] ~ ~ ~ 1 0.6
scoreboard players set recipe_success gm4_zc_data 1
