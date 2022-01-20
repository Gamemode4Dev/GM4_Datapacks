# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# rotate through turn options
scoreboard players add @s gm4_bas_turn 1
execute unless score @s gm4_bas_turn matches 0..2 run scoreboard players set @s gm4_bas_turn 0

execute if score @s gm4_bas_turn matches 0 run playsound minecraft:entity.armor_stand.hit block @a[distance=..6] ~ ~ ~ .2 2
execute if score @s gm4_bas_turn matches 1..2 run playsound minecraft:entity.item_frame.rotate_item master @a[distance=..6] ~ ~ ~ 0.5 2

# advancement for customizing armor_stand
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
