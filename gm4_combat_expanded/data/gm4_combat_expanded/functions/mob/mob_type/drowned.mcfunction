# calculate modifiers for newly spawned drowned
# @s = drowned
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_armor gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_toughness gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_speed gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_damage gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_armor gm4_ce_data 2

# spawn a second drowned if difficulty >= 11
execute if score $difficulty gm4_ce_data matches 11.. if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_toughness gm4_ce_data 1
attribute @s[predicate=gm4_combat_expanded:mob/modifier/dark] zombie.spawn_reinforcements modifier add 88708a3a-b8f0-46f8-8dd9-1f8fb0f315d6 "gm4_ce_modifier_dark" 0.25 multiply_base
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run function gm4_combat_expanded:mob/effect/mountain_zombie
attribute @s[predicate=gm4_combat_expanded:mob/modifier/flowering] generic.max_health modifier add 8650cbae-ca74-423f-96c6-eba2c1c8e80e "gm4_ce_modifier_flowering" -0.25 multiply
execute unless score @s[predicate=gm4_combat_expanded:mob/modifier/flowering] gm4_ce_generation matches 10.. run data modify entity @s ArmorDropChances[3] set value 2F
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_weakness_attacks
execute if predicate gm4_combat_expanded:mob/modifier/deep run scoreboard players add $mob_damage gm4_ce_data 4
tag @s[predicate=gm4_combat_expanded:mob/modifier/deep] add gm4_ce_fatigue_attacks
execute if predicate gm4_combat_expanded:mob/modifier/growth run function gm4_combat_expanded:mob/effect/growth_drowned
execute if predicate gm4_combat_expanded:mob/modifier/reef run function gm4_combat_expanded:mob/effect/reef_drowned

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic
item replace entity @s[predicate=gm4_combat_expanded:mob/modifier/flowering] armor.head with flowering_azalea_leaves{gm4_ce_spore:{type:drowned,generation:0}}
execute if entity @s[predicate=gm4_combat_expanded:mob/modifier/flowering] store result entity @s ArmorItems[3].tag.gm4_ce_spore.generation int 1 run scoreboard players add @s gm4_ce_generation 1
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/generic
item replace entity @s[predicate=gm4_combat_expanded:mob/modifier/reef,predicate=gm4_combat_expanded:technical/chance/reef_trident] weapon.mainhand with trident


# set modifiers
function gm4_combat_expanded:mob/modifier/prep
