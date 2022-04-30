# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mobs/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_speed gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players remove $mob_health gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 4

# biome specific modifiers for this mob
execute if predicate gm4_combat_evolved:mobs/modifiers/burned run data modify entity @s Fuse set value 22
execute if predicate gm4_combat_evolved:mobs/modifiers/flowering run tag @s add gm4_ce_cloaked_creeper
execute if predicate gm4_combat_evolved:mobs/modifiers/flowering run effect give @s invisibility 999999 0
execute if predicate gm4_combat_evolved:mobs/modifiers/flowering run data modify entity @s Fuse set value 37
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run function gm4_combat_evolved:mobs/effects/toxic_creeper
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run tag @s add gm4_ce_toxic_creeper

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
