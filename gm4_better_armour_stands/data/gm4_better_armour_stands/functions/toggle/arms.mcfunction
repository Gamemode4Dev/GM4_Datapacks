# @s = armor_stand to be modified
# at @s
# run from book/apply

data modify entity @s[tag=!gm4_bas_no_arms] ShowArms set value 0
data modify entity @s[tag=gm4_bas_no_arms] ShowArms set value 1

execute if entity @s[tag=!gm4_bas_no_arms] run function gm4_better_armour_stands:toggle/arms_detection

execute store result score @s gm4_bas_data run data get entity @s Small

# normal size
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^.35 ^ ^ 0 0 0 0 4
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run particle block oak_planks ^-.35 ^ ^ 0 0 0 0 4

# small size
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^.2 ^ ^ 0 0 0 0 4
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run particle block oak_planks ^-.2 ^ ^ 0 0 0 0 4

playsound minecraft:entity.armor_stand.place block @a[distance=..5] ~ ~ ~ 0.5 1

scoreboard players set $valid_code gm4_bas_data 1
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
