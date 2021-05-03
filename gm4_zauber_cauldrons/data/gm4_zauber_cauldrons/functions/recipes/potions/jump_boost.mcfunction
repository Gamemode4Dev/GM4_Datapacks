# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item (depending on red/blue fire)
execute unless score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.jump_boost","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]']},HideFlags:32,Potion:"leaping",CustomPotionEffects:[{Id:8,Amplifier:3,Duration:1800}]}}}
execute if score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.jump_boost","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Soulution of Leaping",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.potion.leaping"}]],"italic":false}'},HideFlags:32,Potion:"leaping",CustomPotionEffects:[{Id:8,Amplifier:3,Duration:1800}]}}}

# visuals
summon rabbit ~0.2 ~.7 ~ {RabbitType:99,Tags:["gm4_zc_killer_rabbit"],Attributes:[{Name:"generic.max_health",Base:31.0}],Health:31,ActiveEffects:[{Id:10,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:5,Amplifier:3,Duration:2147483647,ShowParticles:0b}]}
scoreboard players set recipe_success gm4_zc_data 1
