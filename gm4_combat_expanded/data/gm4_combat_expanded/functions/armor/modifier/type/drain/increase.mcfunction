# increase the health bonus on the drain armor
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/drain/check

# put changes on armor piece
scoreboard players set $change gm4_ce_data 1

# get data
execute store result score $curr_level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].amount
execute store result score $max_level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
scoreboard players operation $max_level gm4_ce_data *= #2 gm4_ce_data
scoreboard players add $max_level gm4_ce_data 4

# if level is at cap don't increase it
execute if score $curr_level gm4_ce_data >= $max_level gm4_ce_data run return 0

# increase level by kills, up to max level and store
scoreboard players operation $curr_level gm4_ce_data += @s gm4_ce_kill
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].amount float 1 run scoreboard players operation $curr_level gm4_ce_data < $max_level gm4_ce_data
