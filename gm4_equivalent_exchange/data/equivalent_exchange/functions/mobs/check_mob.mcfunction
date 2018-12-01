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

tag @e[tag=gm4_ee_mob] remove gm4_ee_mob