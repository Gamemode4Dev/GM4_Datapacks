
$damage @s $(burning_damage) in_fire by @p[tag=gm4_aa_augment_damager]

# run unless it is a player
execute if entity @s[type=player] run return 0

# set burning time to 10/65, unless it was higher
execute store result score $fire_time gm4_aa_data run data get entity @s Fire
execute unless score $gleaming.burning gm4_aa_data matches 10.. if score $fire_time gm4_aa_data matches 10.. run return 0
execute if score $gleaming.burning gm4_aa_data matches 10.. if score $fire_time gm4_aa_data matches 65.. run return 0

execute unless score $gleaming.burning gm4_aa_data matches 10.. run data modify entity @s Fire set value 10
execute if score $gleaming.burning gm4_aa_data matches 10.. run data modify entity @s Fire set value 65
