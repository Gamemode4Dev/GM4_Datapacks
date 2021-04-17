#@s = item entity to have enchantments extracted
#run from enchantment_extractors:extract

execute store result score result gm4_ench_random run data get entity @s UUID[0] 0.00000000023283064365386962890625
scoreboard players operation result gm4_ench_random %= #100 gm4_ench_random

execute if score result gm4_ench_random matches ..79 run particle poof ~ ~1.5 ~ 0.2 0.2 0.2 0.05 25 force @a[distance=..10]
execute if score result gm4_ench_random matches ..79 run playsound item.shield.break block @a[distance=..8] ~ ~ ~ 0.6 0.3

execute if score result gm4_ench_random matches 80..89 run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ .8 1.8
execute if score result gm4_ench_random matches 80..89 run summon vex ~ ~-1 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Congealed Enchantment§",{"translate":"entity.gm4.congealed_enchantment"}]}',CustomNameVisible:0,LifeTicks:100,Attributes:[{Name:"generic.attack_damage",Base:2}],Health:4.0f,Motion:[0.0,0.35,0.0]}
execute if score result gm4_ench_random matches 90.. run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ 1.3 .6
execute if score result gm4_ench_random matches 90.. run summon vex ~ ~-1 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Living Enchantment§",{"translate":"entity.gm4.living_enchantment"}]}',CustomNameVisible:0,HandItems:[{id:"minecraft:golden_sword",Count:1},{}],HandDropChances:[0.0f,0.0f],Motion:[0.0,0.25,0.0]}
