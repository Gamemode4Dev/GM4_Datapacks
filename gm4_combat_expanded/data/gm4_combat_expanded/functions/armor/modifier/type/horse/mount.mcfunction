# give mount speed and resistance
# @s = vehicle of player with armor
# at @s
# run from armor/check_modifier/equip

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# give effect
execute if score $level gm4_ce_data matches 1 run effect give @s speed 3 0 true
execute if score $level gm4_ce_data matches 2 run effect give @s speed 3 1 true
execute if score $level gm4_ce_data matches 3 run effect give @s speed 3 2 true
effect give @s resistance 3 0 true
