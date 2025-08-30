# calculate modifiers for newly spawned zombie / zombie villager / husk / drowned
# @s = zombie / zombie villager / husk / drowned
# at @s
# run from mob/init/mob_type

## Stat Block (normal/hard diff)
# health: 18 - 36
# damage: 3 - 6.5 (cap 8)
# speed: 80 - 120%

# base stat nerf
attribute @s minecraft:max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -2 add_value
attribute @s minecraft:movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.2 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 18
scoreboard players set $mob_damage gm4_sr_data 35
scoreboard players set $mob_speed gm4_sr_data 40
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_mob.damage_cap 80
tag @s add gm4_sr_check_damage_cap

# add fire delay to drowned for tridents
scoreboard players set @s[type=drowned] gm4_sr_arrow.fire_delay 10

# remove leader bonus from zombies
execute if data entity @s attributes[{id:"minecraft:max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] run attribute @s minecraft:max_health modifier remove minecraft:leader_zombie_bonus

# remove baby zombies except chicken jockeys (will be turned into Elites with Monsters Unbound)
scoreboard players set $was_baby gm4_sr_data 0
execute if predicate {condition:"all_of",terms:[{condition:"entity_properties",entity:"this",predicate:{flags:{is_baby:1b}}},{condition:"inverted",term:{condition:"entity_properties",entity:"this",predicate:{vehicle:{}}}}]} store success score $was_baby gm4_sr_data run data modify entity @s IsBaby set value 0b
execute if score $was_baby gm4_sr_data matches 1 run tag @s add gm4_sr_was_baby

# set armor
scoreboard players set $override_equipment gm4_sr_data 0
function #gm4_survival_refightalized:equip/zombie
execute if score $override_equipment gm4_sr_data matches 1 run return 1
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/generic/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/generic/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/generic/chest
loot replace entity @s armor.head loot gm4_survival_refightalized:mob/generic/head
