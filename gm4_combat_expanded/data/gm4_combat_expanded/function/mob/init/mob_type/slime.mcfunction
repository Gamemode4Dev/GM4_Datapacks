# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/init/mob_type

# store size for changing
execute store result score $size gm4_ce_data run data get entity @s Size

# base stat nerf
execute unless score $size gm4_ce_data matches 0 run attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -3 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 13
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 80

# | Biome Modifiers
# snowy
execute if score $size gm4_ce_data matches 1..2 if predicate gm4_combat_expanded:mob/modifier/snowy run scoreboard players add $size gm4_ce_data 1
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/flowering run function gm4_combat_expanded:mob/init/modifier/special/flowering_slime
# toxic
tag @s[type=slime,predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_poison_attack
# growth
execute if score $size gm4_ce_data matches 1.. if entity @s[type=slime,tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth] run function gm4_combat_expanded:mob/init/modifier/special/growth_slime
# basalt deltas
execute if score $size gm4_ce_data matches 1..2 if entity @s[type=magma_cube,predicate=gm4_combat_expanded:mob/modifier/nether/basalt_deltas] run scoreboard players add $size gm4_ce_data 1
attribute @s generic.attack_damage modifier add 1c2ac6d1-109f-4724-aafb-7cc43049ee99 "gm4_ce_modifier_basalt_deltas" 0.15 add_multiplied_total

# size changes based on difficulty
execute if score $size gm4_ce_data matches 1..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_common run scoreboard players add $size gm4_ce_data 1
execute if score $size gm4_ce_data matches 1..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_rare run scoreboard players add $size gm4_ce_data 1

# set size
execute if score $size gm4_ce_data matches 0 run scoreboard players set $mob_health gm4_ce_data 0
execute if score $size gm4_ce_data matches 2 run attribute @s generic.attack_damage base set 3
execute if score $size gm4_ce_data matches 3 run attribute @s generic.attack_damage base set 4
execute if score $size gm4_ce_data matches 4 run attribute @s generic.attack_damage base set 5
execute store result entity @s Size int 1 run scoreboard players get $size gm4_ce_data

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
