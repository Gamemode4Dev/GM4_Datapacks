# @s = player who reeled in the armor stand
# run from advancement "reel_loot"

advancement revoke @s only gm4_end_fishing:reel_loot
advancement grant @s only gm4:end_fishing
tag @s add gm4_ef_reel_loot
tag @s add gm4_ef_looted
execute if entity @s[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] run function gm4_end_fishing:durability/prep_mainhand
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:fishing_rod"}]}] run function gm4_end_fishing:durability/prep_offhand

scoreboard players operation $current gm4_ef_id = @s gm4_ef_id
execute as @e[type=armor_stand,tag=gm4_ef_has_fish] if score @s gm4_ef_id = $current gm4_ef_id run tag @s add gm4_ef_reeled_in
execute at @e[type=armor_stand,tag=gm4_ef_reeled_in] run summon marker ~ ~ ~ {Tags:["gm4_ef_loot"]}
execute as @e[type=marker,tag=gm4_ef_loot] at @s run function gm4_end_fishing:reel_in/set_marker_pos
execute if entity @s[tag=gm4_ef_durability_main] at @e[type=marker,tag=gm4_ef_loot] run loot spawn ^ ^ ^1 fish gm4_end_fishing:gameplay/fishing ~ ~ ~ mainhand
execute if entity @s[tag=gm4_ef_durability_off] at @e[type=marker,tag=gm4_ef_loot] run loot spawn ^ ^ ^1 fish gm4_end_fishing:gameplay/fishing ~ ~ ~ offhand
execute as @e[type=item,nbt={Item:{tag:{gm4_end_fishing:{set_data:{type:"entity"}}}}}] run function gm4_end_fishing:reel_in/summon_entity

summon minecraft:experience_orb ~ ~ ~ {Tags:["gm4_ef_set_orb"]}
execute store result score $value gm4_ef_data run data get entity @e[type=experience_orb,tag=gm4_ef_set_orb,limit=1] UUID[0]
scoreboard players operation $value gm4_ef_data %= #6 gm4_ef_data
scoreboard players add $value gm4_ef_data 2
execute store result entity @e[type=experience_orb,tag=gm4_ef_set_orb,limit=1] Value int 1 run scoreboard players get $value gm4_ef_data

# clean up
tag @e[type=experience_orb] remove gm4_ef_set_orb
scoreboard players reset $value gm4_ef_data
tag @s remove gm4_ef_reel_loot
kill @e[type=marker,tag=gm4_ef_loot]
