# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# toggle visibility
execute store result score $invisible gm4_bas_data run data get entity @s Invisible
playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..6] ~ ~ ~ 0.5 0.6

execute if score $invisible gm4_bas_data matches 0 run data modify entity @s Invisible set value 1
execute if score $invisible gm4_bas_data matches 0 run effect give @s glowing 2 0

execute if score $invisible gm4_bas_data matches 1 run data modify entity @s Invisible set value 0
execute if score $invisible gm4_bas_data matches 1 run effect clear @s glowing

# advancement for customizing armor_stand
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
