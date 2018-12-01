#@s = player attacking with a trasmutation stone in their hand
#Run from mobs/check_charge

tag @e[nbt={HurtTime:10s},distance=..4] add gm4_ee_mob

execute as @e[tag=gm4_ee_mob,type=sheep] run function equivalent_exchange:mobs/sheep
execute as @e[tag=gm4_ee_mob,type=rabbit] run function equivalent_exchange:mobs/rabbit
execute as @e[tag=gm4_ee_mob,type=llama] run function equivalent_exchange:mobs/llama
execute as @e[tag=gm4_ee_mob,type=parrot] run function equivalent_exchange:mobs/parrot
execute as @e[tag=gm4_ee_mob,type=shulker] run function equivalent_exchange:mobs/shulker
execute as @e[tag=gm4_ee_mob,type=zombie_villager] run function equivalent_exchange:mobs/zombie_villager
execute as @e[tag=gm4_ee_mob,type=witch] at @s run function equivalent_exchange:mobs/witch

#deplete charge
execute store result score count gm4_ee_hit run data get entity @s SelectedItem.Count

execute if score count gm4_ee_hit matches 2.. run scoreboard players remove count gm4_ee_hit 1
execute if score count gm4_ee_hit matches 2.. run replaceitem entity @s weapon.mainhand minecraft:player_head{gm4_transmutation_stone:1b,SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}},display:{Lore:["§b§oSupercharged"],Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"},gm4_transmutation_charge:0s} 1
execute if score count gm4_ee_hit matches 2.. run summon item ~ ~ ~ {Tags:[gm4_ee_summoned],Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_transmutation_stone:1b,SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}},display:{Lore:["§b§oSupercharged"],Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"},gm4_transmutation_charge:0s}}}
execute if score count gm4_ee_hit matches 2.. store result entity @e[tag=gm4_ee_summoned,sort=nearest,limit=1] Item.tag.gm4_transmutation_charge short 1 run scoreboard players get @s gm4_ee_charge
execute if score count gm4_ee_hit matches 2.. store result entity @e[tag=gm4_ee_summoned,sort=nearest,limit=1] Item.Count byte 1 run scoreboard players get count gm4_ee_hit
execute if score count gm4_ee_hit matches 2.. if score @s gm4_ee_charge matches 0..120 run data remove entity @e[tag=gm4_ee_summoned,sort=nearest,limit=1] Item.tag.display.Lore
execute if score @s gm4_ee_charge matches 101..120 run data remove entity @s SelectedItem.tag.display.Lore
scoreboard players remove @s gm4_ee_charge 20
execute store result entity @s SelectedItem.tag.gm4_transmutation_charge short 1 run scoreboard players get @s gm4_ee_charge


tag @e[tag=gm4_ee_mob,type=zombie] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=skeleton] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=phantom] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=drowned] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=husk] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=stray] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=skeleton_horse] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=zombie_horse] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=zombie_villager] add gm4_ee_undead
tag @e[tag=gm4_ee_mob,type=zombie_pigman] add gm4_ee_undead

effect give @e[tag=gm4_ee_mob,tag=!gm4_ee_undead] instant_health
effect give @e[tag=gm4_ee_mob,tag=gm4_ee_undead] instant_damage

execute at @e[tag=gm4_ee_mob] run particle minecraft:happy_villager ~ ~.6 ~ .2 .3 .2 1 12 normal
execute at @e[tag=gm4_ee_mob] run playsound minecraft:entity.player.breath neutral @a[distance=..6] ~ ~ ~ 0.3 1.1

scoreboard players reset @e[tag=gm4_ee_mob,scores={gm4_ee_hit=0..}] gm4_ee_hit

tag @e[tag=gm4_ee_mob] remove gm4_ee_mob
