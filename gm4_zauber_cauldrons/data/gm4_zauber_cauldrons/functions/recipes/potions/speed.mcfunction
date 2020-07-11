#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"},display:{Lore:['[{"translate":"effect.minecraft.speed","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (3:20)","color":"blue","italic":false}]','[{"translate":"effect.minecraft.weakness","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (6:00)","color":"red","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.1","with":["80",{"translate":"attribute.name.generic.movement_speed"}],"color":"blue","italic":false}','{"translate":"attribute.modifier.take.1","with":["16",{"translate":"attribute.name.generic.attack_damage"}],"color":"blue","italic":false}']},HideFlags:32,Potion:swiftness,CustomPotionEffects:[{Id:1,Amplifier:3,Duration:4000},{Id:18,Amplifier:3,Duration:7200}]}}}
scoreboard players set recipe_success gm4_zc_data 1
