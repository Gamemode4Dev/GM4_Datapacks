# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/init/initiate

# store size for changing
execute store result score $size gm4_ce_data run data get entity @s Size

# base stat nerf
execute unless score $size gm4_ce_data matches 0 run attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -3 add

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 8
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 12
scoreboard players set $mob_toughness gm4_ce_data 0

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# | Biome Modifiers
# snowy
execute if score $size gm4_ce_data matches 1..2 if predicate gm4_combat_expanded:mob/modifier/snowy run scoreboard players add $size gm4_ce_data 1
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/flowering run function gm4_combat_expanded:mob/init/modifier/special/flowering_slime
# toxic
tag @s[type=slime,predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_poison_landing
# growth
execute if score $size gm4_ce_data matches 1.. if entity @s[type=slime,tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth] run function gm4_combat_expanded:mob/init/modifier/special/growth_slime

# size changes based on difficulty
execute if score $difficulty gm4_ce_data matches 50.. if score $size gm4_ce_data matches 1..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_rare run scoreboard players add $size gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 90.. if score $size gm4_ce_data matches 1..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_common run scoreboard players add $size gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 90.. if score $size gm4_ce_data matches 1..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_rare run scoreboard players add $size gm4_ce_data 1

# set size
execute store result entity @s Size int 1 run scoreboard players get $size gm4_ce_data

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
