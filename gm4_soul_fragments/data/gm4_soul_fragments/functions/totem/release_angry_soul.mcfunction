# @s = player taking damage while holding a soul in a totem
# from player/damage_check

# release soul (angry)
summon vex ~ ~1.5 ~ {CustomName:"\"an angry roaming soul\"",Tags:["gm4_angry_soul_fragment"],Passengers:[{id:"minecraft:area_effect_cloud",Tags:["gm4_sf_soul_tracker"],Particle:"block air",Radius:0,Age:-2147483648,CustomName:'"gm4_soul_tracker"'}],CustomNameVisible:0,ActiveEffects:[{Id:14,Amplifier:0,Duration:20000000,ShowParticles:0b}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,Damage:3,tag:{SkullOwner:{Id:[I;-1275901885,1775847455,-1188146681,-2095116733],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODY4NmQ5NmFkOGU1OGE4NmE1YTI4MzI2Yzk5ZmRlOWQ0OTgxZTQ2YzA5ZWFlNTFlN2E5ODYxOTBjZDM2YjBmIn19fQ=="}]}}}}],ArmorDropChances:[0.0F,0.0F,0.0F,-327.670F],Silent:1,DeathLootTable:"minecraft:empty",Health:5.0f,LifeTicks:300}

# copy ID from totem into tracker's score
execute store result score @e[type=area_effect_cloud,tag=gm4_sf_soul_tracker,distance=..1.6,sort=nearest,limit=1] gm4_sf_id run data get entity @s SelectedItem.tag.gm4_soul_fragments.id

# visuals
particle minecraft:soul ~ ~1.2 ~ .2 0 .2 .03 5 normal
execute if entity @s[type=player] run playsound minecraft:block.chorus_flower.death player @a[distance=..5] ~ ~ ~ .9 2

# change soul in totem for regular totem
execute if predicate gm4_soul_fragments:totem/in_mainhand run replaceitem entity @s weapon.mainhand minecraft:totem_of_undying
execute if predicate gm4_soul_fragments:totem/in_offhand run replaceitem entity @s weapon.offhand minecraft:totem_of_undying
