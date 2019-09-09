# @s = beeswax item being crushed by a piston near an item with enchants
# at @s
# run from pulse_check

# tag target item to avoid double selectors
tag @e[type=item,tag=!gm4_wax_on_anvil,dx=0,limit=1,nbt={Item:{tag:{Enchantments:[{}]}}}] add gm4_waxed

# get repair cost into scoreboard
execute store result score repair_cost gm4_bee_data run data get entity @e[type=item,tag=gm4_waxed,dx=0,limit=1] Item.tag.RepairCost

# get amount of wax into scoreboard
execute store result score wax_amount gm4_bee_data run data get entity @s Item.Count

# set repair_costs over 64 to 64
execute if score repair_cost gm4_bee_data matches 65.. if score wax_amount gm4_bee_data matches 64 run scoreboard players set repair_cost gm4_bee_data 64

# check whether enough wax was supplied, if so, try to execute crafting
execute if score repair_cost gm4_bee_data matches 1..63 if score repair_cost gm4_bee_data < wax_amount gm4_bee_data run function ambrosia:beeswax/consume_partial_stack

execute if score repair_cost gm4_bee_data matches 1..64 if score repair_cost gm4_bee_data = wax_amount gm4_bee_data run function ambrosia:beeswax/consume_full_stack

# reset fake players and tags
tag @e[type=item,dx=0] remove gm4_waxed
scoreboard players reset repair_cost gm4_bee_data
scoreboard players reset wax_amount gm4_bee_data
