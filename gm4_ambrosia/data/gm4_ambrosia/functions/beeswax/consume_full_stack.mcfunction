# @s = beeswax item being crushed by a piston near an item with enchants, when the amount of wax equals RepairCost
# at @s
# run from ambrosia:beeswax/prepare_crafting

# kill beeswax
kill @s

# reduce target item's RepairCost by 1
execute store result entity @e[type=item,tag=gm4_waxed,dx=0,limit=1] Item.tag.RepairCost int 1 run scoreboard players remove repair_cost gm4_bee_data 1

# play particle
particle block yellow_concrete_powder ~ ~ ~ 0.1 0 0.1 0.5 5
