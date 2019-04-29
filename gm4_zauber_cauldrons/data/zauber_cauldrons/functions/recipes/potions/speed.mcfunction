#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{display:{Lore:["{\"text\":\"Speed IV (3:20)\",\"color\":\"blue\",\"italic\":\"false\"}","{\"text\":\"Weakness IV (6:00)\",\"color\":\"red\",\"italic\":\"false\"}","{\"text\":\"\"}","{\"text\":\"When Applied:\",\"color\":\"dark_purple\",\"italic\":\"false\"}","{\"text\":\"+80% Speed\",\"color\":\"blue\",\"italic\":\"false\"}","{\"text\":\"-16 Attack Damage\",\"color\":\"red\",\"italic\":\"false\"}"]},HideFlags:32,Potion:swiftness,CustomPotionEffects:[{Id:1,Amplifier:3,Duration:4000},{Id:18,Amplifier:3,Duration:7200}]}}}
scoreboard players set recipe_success gm4_zc_data 1
