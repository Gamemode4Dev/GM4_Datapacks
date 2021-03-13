#Runs at end of a spore's life cycle when spore germinates.
#@s = @e[tag=gm4_shroomite_spore,type=area_effect_cloud,scores={gm4_shroom_time=20..,gm4_sporeprint=6..}] at @s
setblock ~ ~ ~ red_mushroom destroy
summon minecraft:area_effect_cloud ~ ~-.2 ~ {Tags:["gm4_shroomite","gm4_shroomite_shroom"],Duration:2147483647,Particle:"mycelium",Radius:0.3f}
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..15]
