#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=1,dy=1,dz=1]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{display:{Lore:["§9Jump Boost IV (1:30)§r"]},HideFlags:32,Potion:leaping,CustomPotionEffects:[{Id:8,Amplifier:3,Duration:1800}]}}}
summon rabbit ~0.2 ~.7 ~ {RabbitType:99,Attributes:[{Name:"generic.maxHealth",Base:21.0}],Health:21,ActiveEffects:[{Id:6,Amplifier:10,Duration:1,ShowParticles:0b},{Id:5,Amplifier:3,Duration:2147483647,ShowParticles:0b}]}
scoreboard players set recipe_success gm4_zc_data 1
