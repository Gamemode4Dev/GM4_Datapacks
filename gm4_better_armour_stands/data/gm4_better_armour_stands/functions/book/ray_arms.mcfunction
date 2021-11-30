# @s = player right clicking armor_stand with writable_book
# at @s
# run from book/use_arms and book/ray_arms

# Continue searching if no armor_stand in this block
execute unless entity @e[type=minecraft:armor_stand,tag=gm4_bas_no_arms,dx=0,limit=1] if entity @s[distance=..5] positioned ^ ^ ^.1 run function gm4_better_armour_stands:book/ray_arms

# Found armor_stand holding writable_book
execute as @e[type=minecraft:armor_stand,tag=gm4_bas_no_arms,dx=0,sort=nearest,limit=1] at @s run function gm4_better_armour_stands:toggle/arms_detect_remove
