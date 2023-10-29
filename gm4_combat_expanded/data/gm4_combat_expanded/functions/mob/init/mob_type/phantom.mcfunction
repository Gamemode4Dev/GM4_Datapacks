# calculate modifiers for newly spawned phantom
# @s = phantom
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -15 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -1.5 add

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 30
scoreboard players set $mob_damage gm4_ce_data 8
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 8
scoreboard players set $mob_toughness gm4_ce_data 0

scoreboard players set $mob_health.cap gm4_ce_data 22
scoreboard players set $mob_damage.cap gm4_ce_data 6
scoreboard players set $mob_speed.cap gm4_ce_data 0
scoreboard players set $mob_armor.cap gm4_ce_data 5
scoreboard players set $mob_toughness.cap gm4_ce_data 0

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
# burned
effect give @s[predicate=gm4_combat_expanded:mob/modifier/burned] fire_resistance infinite 0 true
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/burned,predicate=gm4_combat_expanded:technical/chance/grow_phantom_slight] Size set value 1
# flowering
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/flowering,predicate=gm4_combat_expanded:technical/chance/grow_phantom_slight] Size set value 1
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/flowering,predicate=gm4_combat_expanded:technical/chance/grow_phantom_large] Size set value 3

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
