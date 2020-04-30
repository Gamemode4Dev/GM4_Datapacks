#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"},display:{Lore:['[{"translate":"effect.minecraft.jump_boost","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]']},HideFlags:32,Potion:leaping,CustomPotionEffects:[{Id:8,Amplifier:3,Duration:1800}]}}}
summon rabbit ~0.2 ~.7 ~ {RabbitType:99,Tags:["gm4_zc_killer_rabbit"],Attributes:[{Name:"generic.maxHealth",Base:31.0}],Health:31,ActiveEffects:[{Id:10,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:5,Amplifier:3,Duration:2147483647,ShowParticles:0b}]}
scoreboard players set recipe_success gm4_zc_data 1
