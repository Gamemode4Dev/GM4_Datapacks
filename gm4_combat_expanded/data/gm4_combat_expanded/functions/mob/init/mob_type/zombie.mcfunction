# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -3 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -1.5 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.04 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 20
scoreboard players set $mob_damage gm4_ce_data 35
scoreboard players set $mob_speed gm4_ce_data 15
scoreboard players set $mob_armor gm4_ce_data 10
scoreboard players set $mob_toughness gm4_ce_data 25

scoreboard players set $mob_health.cap gm4_ce_data 15
scoreboard players set $mob_damage.cap gm4_ce_data 7
scoreboard players set $mob_speed.cap gm4_ce_data 6
scoreboard players set $mob_armor.cap gm4_ce_data 4
scoreboard players set $mob_toughness.cap gm4_ce_data 8

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/generic

# | Difficulty Modifiers
# sprinter
execute if predicate gm4_combat_expanded:technical/chance/zombie_sprinter run attribute @s generic.movement_speed modifier add b04df78c-8b19-434f-bcd0-515133d5e573 "gm4_ce_sprinter_zombie" 0.15 multiply
# solid (KB resist)
execute if predicate gm4_combat_expanded:technical/chance/zombie_solid run attribute @s generic.knockback_resistance modifier add 35504df6-ec60-4229-8063-a2440d56f68c "gm4_ce_solid_zombie" 0.45 add

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
# mountainous
execute if score $phantoms gm4_ce_data matches 0 if predicate gm4_combat_expanded:technical/chance/spawn_mountain_phantom if block ~ ~35 ~ #gm4:air store success score $mob_extras gm4_ce_data run summon phantom ~ ~35 ~ {Tags:["gm4_ce_extra_mob"]}
attribute @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] generic.attack_knockback modifier add 049693ea-5ae7-4a23-b075-407c65e0b103 "gm4_ce_modifier_mountainous" 2 add
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run scoreboard players add $mob_health gm4_ce_data 6
# burned
execute if entity @s[type=husk,predicate=gm4_combat_expanded:mob/modifier/burned] run function gm4_combat_expanded:mob/init/modifier/special/burned_husk
# flowering
execute if predicate gm4_combat_expanded:mob/modifier/flowering run tag @s add gm4_ce_spore_zombie
execute if entity @s[tag=gm4_ce_spore_zombie] run function gm4_combat_expanded:mob/init/modifier/special/flowering_zombie
# toxic
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_weakness_attacks
# deep
attribute @s[type=drowned,predicate=gm4_combat_expanded:mob/modifier/deep] generic.attack_damage modifier add 34e4955b-8f75-4292-89e9-7a1639499717 "gm4_ce_modifier_deep" 0.2 multiply
# reef
execute if entity @s[type=drowned,predicate=gm4_combat_expanded:mob/modifier/reef] run function gm4_combat_expanded:mob/init/modifier/special/reef_drowned
# growth
execute if entity @s[type=!zombie_villager,predicate=gm4_combat_expanded:mob/modifier/growth] run function gm4_combat_expanded:mob/init/modifier/special/growth_zombie
# dark
attribute @s[predicate=gm4_combat_expanded:mob/modifier/dark] zombie.spawn_reinforcements modifier add 88708a3a-b8f0-46f8-8dd9-1f8fb0f315d6 "gm4_ce_modifier_dark" 0.25 multiply
execute if entity @s[type=zombie,tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/dark,predicate=gm4_combat_expanded:technical/chance/extra_zombie_spawn] store success score $mob_extras gm4_ce_data run summon zombie ~0.1 ~0.15 ~0.02 {Tags:["gm4_ce_extra_mob"]}

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# remove bonus damage if weapon is held, then set droprate to 20% (unless in "Dark")
execute if data entity @s HandItems[{Count:1b}] run scoreboard players set $mob_damage gm4_ce_data 0
execute if score $mob_damage gm4_ce_data matches 0 run data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]

# replace "Zombie leaders" with minibosses
execute if data entity @s[type=zombie] Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}] run function gm4_combat_expanded:mob/init/modifier/special/zombie_leader
execute if data entity @s[type=zombie_villager] Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}] run data remove entity @s Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}]
execute if entity @s[tag=gm4_ce_miniboss] run function gm4_combat_expanded:mob/init/modifier/special/zombie_miniboss

# check if zombie is spawned from reinforcements
execute if data entity @s Attributes[{Modifiers:[{Name:"Zombie reinforcement callee charge"}]}] run function gm4_combat_expanded:mob/init/modifier/special/zombie_reinforcement

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
