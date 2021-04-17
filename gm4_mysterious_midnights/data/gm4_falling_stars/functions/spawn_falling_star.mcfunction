#@s = @e[type=area_effect_cloud,tag=gm4_star_impact_point]
#at @s
#called by find_location

#summon falling star
summon shulker_bullet ~ 260 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Falling Star",{"translate":"entity.gm4.falling_star"}]}',Steps:0,Passengers:[{id:"potion",CustomName:'"Falling Star"',Item:{Count:1b,id:"splash_potion",tag:{CustomPotionEffects:[{Id:25,Amplifier:0,Duration:300}],Potion:"thick",CustomPotionColor:16777215}}},{id:"area_effect_cloud",Duration:200,CustomName:'"gm4_falling_star_particle"',Radius:0.5f,Particle:"end_rod"},{id:"item",Age:3600,Tags:["gm4_falling_star_item"],Item:{Count:1b,id:"minecraft:end_stone"}}]}
loot spawn ~ 300 ~ loot gm4_falling_stars:star_type
execute positioned ~ 300 ~ run data modify entity @e[type=item,limit=1,tag=gm4_falling_star_item] Item set from entity @e[type=item,limit=1,distance=..1] Item
execute as @e[type=item,limit=1,tag=gm4_falling_star_item] if data entity @s Item.tag.gm4_endermite_egg run tag @s add gm4_endermite_star

tag @e[type=item] remove gm4_falling_star_item
execute positioned ~ 300 ~ run kill @e[type=item,limit=1,distance=..1]
