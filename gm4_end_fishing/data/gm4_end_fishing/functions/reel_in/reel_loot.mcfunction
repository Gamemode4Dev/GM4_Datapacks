#@s = player who reeled in the armor stand
#run from advancement "reel_loot"

advancement revoke @s only gm4_end_fishing:reel_loot
advancement grant @s only gm4:end_fishing
tag @s add gm4_ef_reel_loot
tag @s add gm4_ef_looted
execute if entity @s[gamemode=!creative,nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] run function gm4_end_fishing:durability/prep_mainhand
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] if entity @s[gamemode=!creative,nbt={Inventory:[{Slot:-106b,id:"minecraft:fishing_rod"}]}] run function gm4_end_fishing:durability/prep_offhand

execute as @e[type=armor_stand,tag=gm4_ef_has_fish] if score @s gm4_ef_id = @p[distance=..0.1] gm4_ef_id run tag @s add gm4_ef_reeled_in
execute as @e[type=armor_stand,tag=gm4_ef_reeled_in] at @s run summon area_effect_cloud ~ ~ ~ {Duration:2,Particle:"block air",Tags:[gm4_ef_loot]}
execute as @e[type=area_effect_cloud,tag=gm4_ef_loot] at @s run tp @s ~ ~ ~ facing entity @p[tag=gm4_ef_reel_loot] eyes
execute as @e[type=area_effect_cloud,tag=gm4_ef_loot] at @s run function gm4_end_fishing:reel_in/move_aec
execute as @e[type=area_effect_cloud,tag=gm4_ef_loot] at @s if entity @a[distance=..2,tag=gm4_ef_reel_loot] if block ^ ^ ^0.5 #gm4:no_collision run tp @s ^ ^ ^0.5
execute as @e[type=area_effect_cloud,tag=gm4_ef_loot] at @s if entity @a[distance=..2,tag=gm4_ef_reel_loot] if block ^ ^ ^0.5 #gm4:no_collision run tp @s ^ ^ ^0.5
execute if entity @s[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] at @e[type=area_effect_cloud,tag=gm4_ef_loot] run loot spawn ^ ^ ^1 fish gm4_end_fishing:gameplay/fishing ~ ~ ~ mainhand
execute if entity @s[nbt=!{SelectedItem:{id:"minecraft:fishing_rod"}},nbt={Inventory:[{Slot:-106b,id:"minecraft:fishing_rod"}]}] at @e[type=area_effect_cloud,tag=gm4_ef_loot] run loot spawn ^ ^ ^1 fish gm4_end_fishing:gameplay/fishing ~ ~ ~ offhand
execute as @e[type=item,nbt={Item:{tag:{gm4_end_fishing:{set_data:{}}}}}] run function gm4_end_fishing:reel_in/set_data

summon minecraft:experience_orb ~ ~ ~ {Tags:[gm4_ef_set_orb]}
scoreboard players operation seed gm4_ef_data *= mult gm4_ef_data
scoreboard players operation seed gm4_ef_data += incr gm4_ef_data
scoreboard players operation result gm4_ef_data = seed gm4_ef_data
scoreboard players operation result gm4_ef_data /= #6 gm4_ef_data
scoreboard players operation result gm4_ef_data %= #6 gm4_ef_data
scoreboard players add result gm4_ef_data 2
execute store result entity @e[type=experience_orb,tag=gm4_ef_set_orb,distance=..1,limit=1,sort=nearest] Value int 1 run scoreboard players get result gm4_ef_data

tag @e[type=experience_orb,tag=gm4_ef_set_orb,nbt=!{Value:0}] remove gm4_ef_set_orb
tag @s remove gm4_ef_reel_loot
