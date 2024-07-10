# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -3 add_value
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf -1 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.05 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 15
scoreboard players set $mob_damage gm4_ce_data 45
scoreboard players set $mob_speed gm4_ce_data 20
scoreboard players set $mob_armor gm4_ce_data 4
scoreboard players set $mob_toughness gm4_ce_data 8
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 90

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest
loot replace entity @s armor.head loot gm4_combat_expanded:mob/equip_armor/generic/head

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
# mountainous
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run function gm4_combat_expanded:mob/init/mob_type/zombie/mountainous
# burned
execute if entity @s[type=husk,predicate=gm4_combat_expanded:mob/modifier/burned] run function gm4_combat_expanded:mob/init/mob_type/zombie/burned_husk
# flowering
execute if predicate gm4_combat_expanded:mob/modifier/flowering run tag @s add gm4_ce_spore_zombie
execute if entity @s[tag=gm4_ce_spore_zombie] run function gm4_combat_expanded:mob/init/mob_type/zombie/flowering
# toxic
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_weakness_attacks
# deep
attribute @s[type=drowned,predicate=gm4_combat_expanded:mob/modifier/deep] generic.movement_speed modifier add gm4_combat_expanded:stat_change.deep 0.2 add_multiplied_base
# reef
execute if entity @s[type=drowned,predicate=gm4_combat_expanded:mob/modifier/reef] run function gm4_combat_expanded:mob/init/mob_type/zombie/reef_drowned
# growth
execute if entity @s[type=!zombie_villager,tag=!gm4_ce_spore_zombie,predicate=gm4_combat_expanded:mob/modifier/growth] run function gm4_combat_expanded:mob/init/mob_type/zombie/growth

# elites
execute if data entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] run function gm4_combat_expanded:mob/init/elite/pick_zombie
execute if data entity @s {IsBaby:1b} run function gm4_combat_expanded:mob/init/elite/pick_zombie
