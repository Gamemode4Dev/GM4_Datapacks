# calculate modifiers for newly spawned phantom
# @s = phantom
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -15 add_value
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -1.5 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 10
scoreboard players set $mob_damage gm4_ce_data 45
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 5
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 60

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
# burned
effect give @s[predicate=gm4_combat_expanded:mob/modifier/burned] fire_resistance infinite 0 true
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/burned,predicate=gm4_combat_expanded:technical/chance/grow_phantom_slight] Size set value 1
# flowering
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/flowering,predicate=gm4_combat_expanded:technical/chance/grow_phantom_slight] Size set value 1
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/flowering,predicate=gm4_combat_expanded:technical/chance/grow_phantom_large] Size set value 2

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
