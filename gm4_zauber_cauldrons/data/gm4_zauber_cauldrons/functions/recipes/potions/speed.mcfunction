# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
data merge storage gm4_zauber_cauldrons:temp/item/potion/common {Item:{tag:{gm4_zauber_cauldrons:{type:"speed"},display:{Lore:['[{"translate":"effect.minecraft.speed","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (3:20)","color":"blue","italic":false}]','[{"translate":"effect.minecraft.weakness","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (6:00)","color":"red","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.1","with":["80",{"translate":"attribute.name.generic.movementSpeed"}],"color":"blue","italic":false}','{"translate":"attribute.modifier.take.1","with":["16",{"translate":"attribute.name.generic.attackDamage"}],"color":"blue","italic":false}']},Potion:swiftness,CustomPotionEffects:[{Id:1,Amplifier:3,Duration:4000},{Id:18,Amplifier:3,Duration:7200}]}}}
scoreboard players set recipe_success gm4_zc_data 1
