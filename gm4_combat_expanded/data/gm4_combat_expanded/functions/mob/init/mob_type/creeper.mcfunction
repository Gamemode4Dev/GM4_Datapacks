# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -6 add

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 12
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 8
scoreboard players set $mob_armor gm4_ce_data 14
scoreboard players set $mob_toughness gm4_ce_data 0

scoreboard players set $mob_health.cap gm4_ce_data 12
scoreboard players set $mob_damage.cap gm4_ce_data 0
scoreboard players set $mob_speed.cap gm4_ce_data 8
scoreboard players set $mob_armor.cap gm4_ce_data 7
scoreboard players set $mob_toughness.cap gm4_ce_data 0

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# | Biome Modifiers
# burned
execute if predicate gm4_combat_expanded:mob/modifier/burned store result entity @s Fuse int 0.75 run data get entity @s Fuse
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/flowering run function gm4_combat_expanded:mob/init/modifier/special/flowering_creeper
# toxic
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/process/toxic_creeper
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_toxic_creeper
# dark
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ExplosionRadius set value 4s

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
