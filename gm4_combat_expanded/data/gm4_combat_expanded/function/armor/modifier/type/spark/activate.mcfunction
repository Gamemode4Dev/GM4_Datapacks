# actiavate spark armor on wearer getting hit
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/spark

item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

scoreboard players set $spark_pieces gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:spark} run scoreboard players add $spark_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:spark} run scoreboard players add $spark_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:spark} run scoreboard players add $spark_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:spark} run scoreboard players add $spark_pieces gm4_ce_data 1

tag @s add gm4_ce_self
execute on attacker run scoreboard players operation @s[tag=!gm4_ce_self] gm4_ce_lightning_charge += $spark_pieces gm4_ce_data
execute on attacker run scoreboard players set @s[tag=!gm4_ce_self] gm4_ce_lightning_charge.timer 160
tag @s remove gm4_ce_self

# spark processing is run through the weapon modifier
schedule function gm4_combat_expanded:clocks/temp/lightning 1t
