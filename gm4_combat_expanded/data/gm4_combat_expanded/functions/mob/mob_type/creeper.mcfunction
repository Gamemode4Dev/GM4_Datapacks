# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_speed gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players remove $mob_health gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 4

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/dark store result score $blast_rad gm4_ce_data run data get entity @s ExplosionRadius
execute if predicate gm4_combat_expanded:mob/modifier/dark store result entity @s ExplosionRadius byte 1 run scoreboard players add $blast_rad gm4_ce_data 1
execute if predicate gm4_combat_expanded:mob/modifier/burned run data modify entity @s Fuse set value 22
execute if predicate gm4_combat_expanded:mob/modifier/flowering run tag @s add gm4_ce_cloaked_creeper
execute if predicate gm4_combat_expanded:mob/modifier/flowering run effect give @s invisibility 35 0
execute if predicate gm4_combat_expanded:mob/modifier/flowering run data modify entity @s Fuse set value 37
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/effect/toxic_creeper
execute if predicate gm4_combat_expanded:mob/modifier/toxic run tag @s add gm4_ce_toxic_creeper

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
