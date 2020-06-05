#@s = all mooshrooms
execute store result score @s gm4_shroom_time run data get entity @e[limit=1,sort=random] UUID[0]
execute if score @s gm4_shroom_time matches -10..10 run setblock ~ ~ ~ red_mushroom
execute if score @s gm4_shroom_time matches -10..10 run playsound minecraft:block.chorus_flower.grow hostile @a[distance=..10] ~ ~ ~ 0.625
execute if score @s gm4_shroom_time matches -10..10 align xyz run summon minecraft:area_effect_cloud ~ ~-.45 ~ {Tags:["gm4_shroomite","gm4_shroomite_shroom"],Duration:2147483647,Particle:"mycelium",Radius:0.3f}

#disable nearby mooshrooms
tag @e[type=mooshroom,distance=..5] add gm4_shroomite_barren
