#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{display:{Lore:["{\"text\":\"Regeneration IV (0:22)\",\"color\":\"blue\",\"italic\":\"false\"}","{\"text\":\"Speed III (0:16)\",\"color\":\"blue\",\"italic\":\"false\"}"]},HideFlags:32,Potion:regeneration,CustomPotionEffects:[{Id:10,Amplifier:3,Duration:440},{Id:1,Amplifier:2,Duration:320}]}}}
summon area_effect_cloud ~ ~.75 ~ {CustomName:"\"the mess they made\"",Radius:1.8f,Duration:2147483647,RadiusOnUse:-0.01f,RadiusPerTick:-0.0002f,ReapplicationDelay:40,Effects:[{Duration:1280,Id:20b,Amplifier:5b},{Duration:40,Id:7b,Amplifier:1b}]}
scoreboard players set recipe_success gm4_zc_data 1
