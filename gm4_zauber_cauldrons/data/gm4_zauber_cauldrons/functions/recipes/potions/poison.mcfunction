# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"},display:{Lore:['[{"translate":"effect.minecraft.poison","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (0:32)","color":"red","italic":false}]']},HideFlags:32,Potion:poison,CustomPotionEffects:[{Id:19,Amplifier:3,Duration:640}]}}}
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
summon cave_spider ~ ~.95 ~.1
fill ~1 ~ ~-1 ~1 ~1 ~-1 cobweb keep
execute if block ~1 ~ ~-1 air run summon cave_spider ~1 ~ ~-1
fill ~-1 ~ ~ ~-1 ~ ~ cobweb keep
execute if block ~-1 ~ ~ air run summon cave_spider ~-1 ~ ~
fill ~-1 ~ ~-1 ~-1 ~1 ~ cobweb keep
execute if block ~-1 ~1 ~ air run summon cave_spider ~-1 ~1 ~
fill ~-1 ~ ~-1 ~-1 ~1 ~ cobweb keep
execute if block ~-1 ~1 ~ air run summon cave_spider ~-1 ~1 ~
fill ~1 ~1 ~1 ~1 ~1 ~1 cobweb keep
scoreboard players set recipe_success gm4_zc_data 1
