# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -2 add

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 8.. run data modify entity @s[predicate=gm4_combat_expanded:technical/chance/slime_grow_rare] Size set value 4
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s[predicate=gm4_combat_expanded:technical/chance/slime_grow_common] Size set value 4
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s[predicate=gm4_combat_expanded:technical/chance/slime_grow_rare] Size set value 5

execute store result score $size gm4_ce_data run data get entity @s Size

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/flowering run function gm4_combat_expanded:mob/effect/flowering_slime
tag @s[type=slime,predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_poison_landing
execute if score $size gm4_ce_data matches 1.. if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth] run function gm4_combat_expanded:mob/effect/growth_slime

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
