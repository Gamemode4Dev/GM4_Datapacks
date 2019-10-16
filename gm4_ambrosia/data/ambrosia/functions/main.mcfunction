# check for larvae on barrels to create hive
execute as @e[type=item,nbt={Item:{id:"minecraft:white_dye",tag:{gm4_ambrosia:{item:"larvae"}},Count:1b}}] at @s if block ~ ~-1 ~ barrel unless entity @e[distance=..1,type=area_effect_cloud,tag=gm4_beehive] run function ambrosia:larvae/validate_larvae

# process beehives
execute as @e[type=area_effect_cloud,tag=gm4_beehive] at @s run function ambrosia:hive/process_hive

# process bees
execute as @e[type=vex,tag=gm4_roaming_bee] run function ambrosia:beehavior/kill_roaming_bee

# wax smooshing
scoreboard players reset found_item_on_anvil gm4_bee_data
execute as @e[type=item,nbt={Item:{tag:{gm4_ambrosia:{item:"beeswax"}}}}] at @s if block ~ ~-1 ~ #minecraft:anvil run function ambrosia:beeswax/item_on_anvil

# repair broken skulls
function ambrosia:hive/repair_skulls

schedule function ambrosia:main 16t
