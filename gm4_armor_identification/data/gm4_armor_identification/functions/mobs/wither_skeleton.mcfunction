# run from mobs/initiate
# @s = wither skeleton
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 8.. run scoreboard players add $mob_damage gm4_ai_data 3
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_health gm4_ai_data 5
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_damage gm4_ai_data 3
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_speed gm4_ai_data 2

# set armor
loot replace entity @s armor.feet loot gm4_armor_identification:mobs/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_armor_identification:mobs/equip_weapon/wither_skeleton

# give arrow if wielding bow and remove drop chance
execute if data entity @s HandItems[{id:"minecraft:bow"}] run item replace entity @s weapon.offhand with tipped_arrow{CustomPotionEffects:[{Id:20b,Amplifier:0b,Duration:200}],CustomPotionColor:3484199}
data modify entity @s HandDropChances[1] set value -327.670F

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
