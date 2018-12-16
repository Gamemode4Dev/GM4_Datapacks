#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Lore:["§cInstant Damage IV§r"]},HideFlags:32,Potion:harming,CustomPotionEffects:[{Id:7,Amplifier:3,Duration:1}]}}}
particle block red_nether_bricks ~ ~.2 ~ .1 .1 .1 10 30
summon area_effect_cloud ~ ~.75 ~ {Radius:1.25f,Duration:2147483647,RadiusOnUse:-0.09f,RadiusPerTick:0.000026f,ReapplicationDelay:20,Effects:[{Duration:1,Id:6b,Amplifier:2b}]}
scoreboard players set recipe_success gm4_zc_data 1
