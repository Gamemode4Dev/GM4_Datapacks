# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# reset armor_stand
execute unless entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:sneaking] run function #gm4_better_armour_stands:default

# reset pose of specific armor_stand part
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:default/part
