# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -5 add

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 12
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 15
scoreboard players set $mob_armor gm4_ce_data 7
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 80

# | Biome Modifiers
# snowy
execute if predicate gm4_combat_expanded:mob/modifier/snowy run function gm4_combat_expanded:mob/init/modifier/special/snowy_creeper
# mountainous
attribute @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] generic.knockback_resistance modifier add d1a07954-66f4-4da8-86a4-42fc863b760b "gm4_ce_modifier_mountainous" 0.4 add
# burned
execute if predicate gm4_combat_expanded:mob/modifier/burned store result entity @s Fuse int 0.75 run data get entity @s Fuse
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/flowering run function gm4_combat_expanded:mob/init/modifier/special/flowering_creeper
# toxic
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/process/toxic_creeper
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_toxic_creeper
# growth
attribute @s[predicate=gm4_combat_expanded:mob/modifier/growth] generic.movement_speed modifier add abf4db3b-a9b1-407b-a012-38c1c5c14e5f "gm4_ce_modifier_growth" 0.2 multiply_base
# dark
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ExplosionRadius set value 4s

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
