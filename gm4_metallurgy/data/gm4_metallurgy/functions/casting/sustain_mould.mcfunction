# @s = armor_stand moulds
# run from main


# kill moulds that left their sand block

scoreboard players remove @s gm4_ml_heat 1
execute if block ~ ~1 ~ lava run scoreboard players add @s gm4_ml_heat 3
execute if score @s gm4_ml_heat matches 1..89 unless block ~ ~ ~ #minecraft:sand run function gm4_metallurgy:casting/destroy_mould
execute unless score @s gm4_ml_heat matches 1..89 run function gm4_metallurgy:casting/destroy_mould

# update old casts (pre PR#487: https://github.com/Gamemode4Dev/GM4_Datapacks/pull/487)
execute if score @s gm4_ml_heat matches 50..89 align xyz positioned ~ ~1 ~ as @e[type=item,dx=0,dy=0,dz=0,tag=!gm4_ml_has_latest_nbt] if data entity @s Item.tag.gm4_metallurgy.stored_shamir run function gm4_metallurgy:update_nbt_version/load_band

# add metals if player desires to do so
execute if score @s gm4_ml_heat matches 50..89 align xyz positioned ~ ~1 ~ if entity @e[type=item,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{metal:{castable:1b}}}},OnGround:1b},dx=0,dy=0,dz=0] run function gm4_metallurgy:casting/add_metal/initialize

# hot ring without metal
execute if score @s[tag=!gm4_contains_metal] gm4_ml_heat matches 50..51 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420024,SkullOwner:"$mould/hot_empty"}

# hot ring with metal
execute if score @s[tag=gm4_contains_metal] gm4_ml_heat matches 50..51 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420026,SkullOwner:"$mould/hot_metal"}

# cool (I'm way too awesome!) ring without metals
execute if score @s[tag=!gm4_contains_metal] gm4_ml_heat matches 48..49 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420023,SkullOwner:"$mould/cool_empty"}

# cool ring with metal
execute if score @s[tag=gm4_contains_metal] gm4_ml_heat matches 48..49 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420025,SkullOwner:"$mould/cool_metal"}


execute if score @s gm4_ml_heat matches 56.. run particle lava ~ ~1 ~ 0 0 0 0.005 1
execute if score @s gm4_ml_heat matches 80.. run particle large_smoke ~ ~1 ~ 0 0 0 0.05 6
