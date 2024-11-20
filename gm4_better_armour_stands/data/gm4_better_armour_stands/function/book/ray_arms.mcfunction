# @s = player right clicking armor_stand with writable_book
# at @s
# run from book/use_arms and book/ray_arms

# select armor_stand without arms
execute positioned ~-.2 ~-.2 ~-.2 as @e[type=minecraft:armor_stand,tag=gm4_bas_no_arms,dx=0,limit=1] positioned ~-.6 ~-.6 ~-.6 run tag @s[dx=0] add gm4_bas_selected

# continue searching if not inside armor_stand
execute unless entity @e[type=minecraft:armor_stand,tag=gm4_bas_no_arms,tag=gm4_bas_selected,limit=1] unless entity @s[distance=6..] positioned ^ ^ ^.5 run function gm4_better_armour_stands:book/ray_arms

# found armor_stand holding writable_book
execute as @e[type=minecraft:armor_stand,tag=gm4_bas_no_arms,tag=gm4_bas_selected,limit=1] at @s run function gm4_better_armour_stands:toggle/arms/select
