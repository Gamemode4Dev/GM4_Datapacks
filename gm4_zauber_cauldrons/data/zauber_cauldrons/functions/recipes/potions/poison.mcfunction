#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{display:{Lore:["§cPoison IV (0:32)§r"]},HideFlags:32,Potion:poison,CustomPotionEffects:[{Id:19,Amplifier:3,Duration:640}]}}}
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
fill ~1 ~ ~-1 ~1 ~1 ~-1 cobweb replace #zauber_cauldrons:air
execute if block ~1 ~ ~-1 #zauber_cauldrons:air run summon cave_spider ~1 ~ ~-1
fill ~-1 ~ ~ ~-1 ~ ~ cobweb replace #zauber_cauldrons:air
execute if block ~-1 ~ ~ #zauber_cauldrons:air run summon cave_spider ~-1 ~ ~
fill ~-1 ~ ~-1 ~-1 ~1 ~ cobweb replace #zauber_cauldrons:air
execute if block ~-1 ~1 ~ #zauber_cauldrons:air run summon cave_spider ~-1 ~1 ~
fill ~-1 ~ ~-1 ~-1 ~1 ~ cobweb replace #zauber_cauldrons:air
execute if block ~-1 ~1 ~ #zauber_cauldrons:air run summon cave_spider ~-1 ~1 ~
fill ~1 ~1 ~1 ~1 ~1 ~1 cobweb replace #zauber_cauldrons:air
scoreboard players set recipe_success gm4_zc_data 1
