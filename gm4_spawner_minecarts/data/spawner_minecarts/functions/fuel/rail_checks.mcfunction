#@s = spawner minecarts
#run from main
#checks if the minecart is .21 blocks into adj. blocks (cart position: .71, setblock offset: .29)

execute if block ~.29 ~ ~ activator_rail[powered=true] run tag @s add gm4_spawner_minecart_on_activator_rail
execute if block ~-.29 ~ ~ activator_rail[powered=true] run tag @s add gm4_spawner_minecart_on_activator_rail
execute if block ~ ~ ~.29 activator_rail[powered=true] run tag @s add gm4_spawner_minecart_on_activator_rail
execute if block ~ ~ ~-.29 activator_rail[powered=true] run tag @s add gm4_spawner_minecart_on_activator_rail
#run active regen if successfull
execute if entity @s[tag=gm4_spawner_minecart_on_activator_rail] run function spawner_minecarts:fuel/active_regeneration

#prepare for send pulse when fully charged
execute if score @s gm4_spawner_fuel matches 200.. run tag @s add gm4_spawner_minecart_full

#reset tags
tag @s remove gm4_spawner_minecart_on_activator_rail
