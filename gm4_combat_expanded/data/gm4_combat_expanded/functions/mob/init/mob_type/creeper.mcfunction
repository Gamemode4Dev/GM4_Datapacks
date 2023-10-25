# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -2 add

# calculate stats based on difficulty
scoreboard players operation $mob_speed gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players remove $mob_health gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 4

# biome specific modifiers for this mob
data modify entity @s[predicate=gm4_combat_expanded:mob/init/modifier/dark] ExplosionRadius set value 4s
data modify entity @s[predicate=gm4_combat_expanded:mob/init/modifier/burned] Fuse set value 22
execute if predicate gm4_combat_expanded:mob/modifier/flowering run function gm4_combat_expanded:mob/init/modifier/special/flowering_creeper
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/process/toxic_creeper
tag @s[predicate=gm4_combat_expanded:mob/init/modifier/toxic] add gm4_ce_toxic_creeper

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
