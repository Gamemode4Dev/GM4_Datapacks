# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"},display:{Lore:['[{"translate":"effect.minecraft.instant_health","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false}]','[{"translate":"effect.minecraft.nausea","color":"red","italic":false},{"text":" (0:08)","color":"red","italic":false}]']},HideFlags:32,Potion:healing,CustomPotionEffects:[{Id:6,Amplifier:3,Duration:1},{Id:9,Amplifier:0,Duration:160}]}}}
summon area_effect_cloud ~ ~.75 ~ {CustomName:"\"their own incompetence\"",Radius:2.1f,Duration:2147483647,RadiusOnUse:-0.75f,RadiusPerTick:-0.0005f,ReapplicationDelay:0,Effects:[{Duration:40,Id:7b,Amplifier:8b,ShowParticles:1b}]}
scoreboard players set recipe_success gm4_zc_data 1
