# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item (depending on red/blue fire)
execute unless score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.regeneration","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (0:22)","color":"blue","italic":false}]','[{"translate":"effect.minecraft.speed","color":"blue","italic":false}," ",{"translate":"potion.potency.2","color":"blue","italic":false},{"text":" (0:16)","color":"blue","italic":false}]']},HideFlags:32,Potion:"regeneration",CustomPotionEffects:[{Id:10,Amplifier:3,Duration:440},{Id:1,Amplifier:2,Duration:320}]}}}
execute if score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.regeneration","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (0:22)","color":"blue","italic":false}]','[{"translate":"effect.minecraft.speed","color":"blue","italic":false}," ",{"translate":"potion.potency.2","color":"blue","italic":false},{"text":" (0:16)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Soulution of Regeneration",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.potion.regeneration"}]],"italic":false}'},HideFlags:32,Potion:"regeneration",CustomPotionEffects:[{Id:10,Amplifier:3,Duration:440},{Id:1,Amplifier:2,Duration:320}]}}}

# visuals
summon area_effect_cloud ~ ~.75 ~ {CustomName:'"the mess they made"',Radius:1.8f,Duration:2147483647,RadiusOnUse:-0.01f,RadiusPerTick:-0.0002f,ReapplicationDelay:40,Effects:[{Duration:1280,Id:20b,Amplifier:5b},{Duration:40,Id:7b,Amplifier:1b}]}
scoreboard players set recipe_success gm4_zc_data 1
