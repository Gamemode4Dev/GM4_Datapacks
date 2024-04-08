# maintains active moulds
# @s = armor_stand moulds
# at @s positioned ~ ~1.23 ~ (at the x-z location of the mould, just above the surface of the sand)
# run from main

# manage heat
scoreboard players remove @s gm4_ml_heat 1
execute if block ~ ~ ~ lava run scoreboard players add @s gm4_ml_heat 3

# kill moulds that left their sand block
execute if score @s gm4_ml_heat matches 1..89 unless block ~ ~-1 ~ #minecraft:sand run function gm4_metallurgy:casting/destroy_mould
execute unless score @s gm4_ml_heat matches 1..89 run function gm4_metallurgy:casting/destroy_mould

# add metals if player desires to do so
execute if score @s gm4_ml_heat matches 50..89 align xyz if entity @e[type=item,predicate=gm4_metallurgy:is_castable,nbt={OnGround:1b},dx=0,dy=0,dz=0] run function gm4_metallurgy:casting/add_metal/initialize

# hot ring without metal
execute if score @s[tag=!gm4_contains_metal] gm4_ml_heat matches 50..51 run item modify entity @s armor.head gm4_metallurgy:mould/hot_empty

# hot ring with metal
execute if score @s[tag=gm4_contains_metal] gm4_ml_heat matches 50..51 run item modify entity @s armor.head gm4_metallurgy:mould/hot_metal

# cool (I'm way too awesome!) ring without metals
execute if score @s[tag=!gm4_contains_metal] gm4_ml_heat matches 48..49 run item modify entity @s armor.head gm4_metallurgy:mould/cool_empty

# cool ring with metal
execute if score @s[tag=gm4_contains_metal] gm4_ml_heat matches 48..49 run item modify entity @s armor.head gm4_metallurgy:mould/cool_metal


execute if score @s gm4_ml_heat matches 56.. run particle lava ~ ~ ~ 0 0 0 0.005 1
execute if score @s gm4_ml_heat matches 80.. run particle large_smoke ~ ~ ~ 0 0 0 0.05 6
