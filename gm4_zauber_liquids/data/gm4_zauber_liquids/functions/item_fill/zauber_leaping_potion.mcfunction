# run from gm4_zauber_liquids:item_fill
# @s = tank being processed

# $item_value set in item_fill function for efficiency
execute unless block ~ ~-1 ~ soul_fire run data merge storage gm4_liquid_tanks:temp/tank {output:{id:potion,tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.jump_boost","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]']},HideFlags:32,Potion:"leaping",CustomPotionEffects:[{Id:8,Amplifier:3,Duration:1800}]}}}
execute if block ~ ~-1 ~ soul_fire run data merge storage gm4_liquid_tanks:temp/tank {output:{id:potion,tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.jump_boost","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (1:30)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s","with":["Soulution of Leaping",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle"},{"translate":"item.minecraft.potion.effect.leaping"}]],"italic":false}'},HideFlags:32,Potion:"leaping",CustomPotionEffects:[{Id:8,Amplifier:3,Duration:1800}]}}}
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
