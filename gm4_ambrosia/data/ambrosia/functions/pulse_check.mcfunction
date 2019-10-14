#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = ambrosia gm4_clock_tick run function ambrosia:main

# edit larvae item to assign a harvest_time to them
execute as @a[scores={gm4_leaf_broken=1..}] at @s run function ambrosia:larvae/leaf_broken

# smooshing of wax onto tool
execute if score found_item_on_anvil gm4_bee_data matches 1 as @e[type=item,tag=gm4_wax_on_anvil] at @s if block ~ ~ ~ minecraft:moving_piston align xyz if entity @e[type=item,dx=0,nbt={Item:{tag:{Enchantments:[{}]}}}] run function ambrosia:beeswax/prepare_crafting

# multi-use honey
execute if score player_consumed_honey gm4_bee_data matches 1 as @a[tag=gm4_drank_honey] run function ambrosia:honey_bottle/consume_honey
