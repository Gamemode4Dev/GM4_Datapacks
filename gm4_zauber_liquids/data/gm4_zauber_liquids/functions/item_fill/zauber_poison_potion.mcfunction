# run from gm4_zauber_liquids:item_fill
# @s = tank being processed

# $item_value set in item_fill function for efficiency
execute unless block ~ ~-1 ~ soul_fire run data merge storage gm4_liquid_tanks:temp/tank {output:{id:potion,tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.poison","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (0:32)","color":"red","italic":false}]']},HideFlags:32,Potion:"poison",CustomPotionEffects:[{Id:19,Amplifier:3,Duration:640}]}}}
execute if block ~ ~-1 ~ soul_fire run data merge storage gm4_liquid_tanks:temp/tank {output:{id:potion,tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.poison","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (0:32)","color":"red","italic":false}]'],Name:'{"translate":"%1$s","with":["Soulution of Poison",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle"},{"translate":"item.minecraft.potion.effect.poison"}]],"italic":false}'},HideFlags:32,Potion:"poison",CustomPotionEffects:[{Id:19,Amplifier:3,Duration:640}]}}}
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
