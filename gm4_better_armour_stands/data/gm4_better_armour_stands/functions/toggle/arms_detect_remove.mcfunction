# @s = armor_stand to be modified
# at @s
# run from holding_book

tp @e[type=villager,tag=gm4_bas_arms_detect,distance=..1,sort=nearest,limit=1] ~ -1000 ~
tag @s remove gm4_bas_no_arms

execute if entity @p[distance=..5,predicate=gm4_better_armour_stands:holding/mainhand/book_arms] run function gm4_better_armour_stands:toggle/arms
