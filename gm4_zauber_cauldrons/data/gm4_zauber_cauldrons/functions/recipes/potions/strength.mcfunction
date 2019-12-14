#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:potion,Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"},display:{Lore:['[{"translate":"effect.minecraft.strength","color":"blue","italic":false},{"text":" IV (1:30)","color":"blue","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.0","with":["12",{"translate":"attribute.name.generic.attackDamage"}],"color":"blue","italic":false}']},HideFlags:32,Potion:strength,CustomPotionEffects:[{Id:5,Amplifier:3,Duration:1800}]}}}
fill ~-1 ~ ~-1 ~1 ~1 ~1 fire replace air
playsound item.firecharge.use block @a[distance=..16] ~ ~ ~ 1 0.6
scoreboard players set recipe_success gm4_zc_data 1
