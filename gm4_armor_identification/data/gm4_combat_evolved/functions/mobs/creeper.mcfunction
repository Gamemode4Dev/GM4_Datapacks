# run from mobs/initiate
# @s = creeper
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_speed gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players remove $mob_health gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 4

# biome specific modifiers for this mob
execute if predicate gm4_combat_evolved:mobs/modifiers/burned run data modify entity @s Fuse set value 22
execute if predicate gm4_combat_evolved:mobs/modifiers/flowering run tag @s add gm4_ce_cloaking_creeper
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run effect give @s blindness 1000000 0 true
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run effect give @s weakness 1000000 1
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run effect give @s nausea 1000000 0 true

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
