# run from mobs/initiate
# @s = wither skeleton
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_damage gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_health gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_damage gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_speed gm4_ce_data 2

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# set armor
loot replace entity @s armor.feet loot gm4_combat_evolved:mobs/equip_armor/wither_skeleton
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_evolved:mobs/equip_weapon/wither_skeleton

# withering arrow
execute if data entity @s HandItems[{id:"minecraft:bow"}] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_evolved:mobs/equip_arrow/withering
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
