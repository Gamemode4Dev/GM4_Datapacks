#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=1,dy=1,dz=1]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{display:{Lore:["§9Speed IV (3:20)§r","§cWeakness IV (6:00)§r","","§5When Applied:§r","§9+80% Speed§r","§c-16 Attack Damage§r"]},HideFlags:32,Potion:swiftness,CustomPotionEffects:[{Id:1,Amplifier:3,Duration:4000},{Id:18,Amplifier:3,Duration:7200}]}}}
scoreboard players set recipe_success gm4_zc_data 1
