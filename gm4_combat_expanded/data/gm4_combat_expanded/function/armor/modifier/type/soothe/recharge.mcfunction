# recharge the heal pulse armor piece when cooldown is over
# @s = player wearing soothing armour
# at @s
# run from armor/modifier/type/soothe/check

# mark for change
scoreboard players set $change gm4_ce_data 1

# add kills to the recharge
execute store result score $recharge gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.recharge
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.recharge int 1 run scoreboard players operation $recharge gm4_ce_data += @s gm4_ce_kill

# update the lore
execute store result score $max_charge gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.max_charge
execute if score $recharge gm4_ce_data >= $max_charge gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/soothe/recharge_fully
execute unless score $recharge gm4_ce_data >= $max_charge gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/soothe/recharge_text with storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded
