# calculate modifiers for newly spawned skeleton / stray
# @s = skeleton / stray
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -8 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.08 multiply

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 12
scoreboard players set $mob_damage gm4_ce_data 6
scoreboard players set $mob_speed gm4_ce_data 12
scoreboard players set $mob_armor gm4_ce_data 7
scoreboard players set $mob_toughness gm4_ce_data 3

scoreboard players set $mob_health.cap gm4_ce_data 12
scoreboard players set $mob_damage.cap gm4_ce_data 6
scoreboard players set $mob_speed.cap gm4_ce_data 10
scoreboard players set $mob_armor.cap gm4_ce_data 5
scoreboard players set $mob_toughness.cap gm4_ce_data 2

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/skeleton

# difficulty based effects
execute if entity @s[type=skeleton] store success score $arrow gm4_ce_data run loot replace entity @s[predicate=gm4_combat_expanded:technical/chance/skeleton_harming_arrow,predicate=!gm4_combat_expanded:mob/modifier/growth] weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/skeleton_harming
execute if entity @s[type=stray] store success score $arrow gm4_ce_data run loot replace entity @s[predicate=gm4_combat_expanded:technical/chance/skeleton_harming_arrow,predicate=!gm4_combat_expanded:mob/modifier/growth] weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_harming

# | Biome Modifiers
# snowy
execute if entity @s[type=stray,predicate=gm4_combat_expanded:mob/modifier/snowy,predicate=!gm4_combat_expanded:mob/modifier/growth] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_snowy
# mountainous
execute if predicate gm4_combat_expanded:technical/chance/spawn_mountain_phantom store success score $mob_extras gm4_ce_data run summon phantom ~ ~35 ~ {Tags:["gm4_ce_extra_mob"]}
# flowering
execute if predicate gm4_combat_expanded:technical/chance/replace_flowering_skeleton run function gm4_combat_expanded:mob/init/modifier/special/flowering_skeleton
# toxic
execute if entity @s[type=skeleton,predicate=gm4_combat_expanded:mob/modifier/toxic,predicate=!gm4_combat_expanded:mob/modifier/growth] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/skeleton_toxic
execute if entity @s[type=stray,predicate=gm4_combat_expanded:mob/modifier/toxic,predicate=!gm4_combat_expanded:mob/modifier/growth] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_toxic
# growth
execute if predicate gm4_combat_expanded:mob/modifier/growth run function gm4_combat_expanded:mob/init/modifier/special/growth_skeleton
# dark
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_speed gm4_ce_data 2
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_toughness gm4_ce_data 2
# soul sand valley
execute if predicate gm4_combat_expanded:mob/modifier/nether/soul_sand_valley run effect give @s fire_resistance infinite 0 true

# drop rate for custom arrows
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
