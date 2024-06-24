# calculate modifiers for newly spawned skeleton / stray
# @s = skeleton / stray
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -5 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.20 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 12
scoreboard players set $mob_damage gm4_ce_data 35
scoreboard players set $mob_speed gm4_ce_data 20
scoreboard players set $mob_armor gm4_ce_data 6
scoreboard players set $mob_toughness gm4_ce_data 4
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 75

# | Difficulty Modifiers
# harming arrow
execute if entity @s[type=skeleton] store success score $arrow gm4_ce_data run loot replace entity @s[predicate=gm4_combat_expanded:technical/chance/skeleton_harming_arrow,predicate=!gm4_combat_expanded:mob/modifier/growth] weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/skeleton_harming
execute if entity @s[type=stray] store success score $arrow gm4_ce_data run loot replace entity @s[predicate=gm4_combat_expanded:technical/chance/skeleton_harming_arrow,predicate=!gm4_combat_expanded:mob/modifier/growth] weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_harming

# | Biome Modifiers
# snowy
execute if entity @s[type=stray,predicate=gm4_combat_expanded:mob/modifier/snowy,predicate=!gm4_combat_expanded:mob/modifier/growth] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_snowy
# mountainous
execute if predicate gm4_combat_expanded:mob/modifier/mountainous positioned ~ ~35 ~ store result score $phantom_count gm4_ce_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_ce_data matches 0 if score $nearby_home_bed gm4_ce_data matches 0 if score $phantom_count gm4_ce_data < $mob_limit.phantom gm4_ce_data if predicate gm4_combat_expanded:technical/chance/spawn_mountain_phantom store success score $mob_extras gm4_ce_data run summon phantom ~ ~35 ~ {Tags:["gm4_ce_extra_mob","gm4_ce_phantom"]}
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

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest
loot replace entity @s armor.head loot gm4_combat_expanded:mob/equip_armor/generic/head
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/skeleton

# drop rate for custom arrows
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
