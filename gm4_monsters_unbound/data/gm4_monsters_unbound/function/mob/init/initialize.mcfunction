# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# /!\ This function only runs if Survival Refightalized is not installed

scoreboard players reset $mob_extras gm4_sr_data
tag @s add gm4_mu_processed

# remove baby zombies except chicken jockeys (will be turned into Elites)
scoreboard players set $was_baby gm4_mu_data 0
execute if entity @s[type=zombie] if predicate {condition:"all_of",terms:[{condition:"entity_properties",entity:"this",predicate:{flags:{is_baby:1b}}},{condition:"inverted",term:{condition:"entity_properties",entity:"this",predicate:{vehicle:{}}}}]} store success score $was_baby gm4_mu_data run data modify entity @s IsBaby set value 0b
execute if score $was_baby gm4_mu_data matches 1 run tag @s add gm4_sr_was_baby

function gm4_monsters_unbound:mob/init/mob_type


# heal to max health
effect give @s[type=#minecraft:undead] instant_damage 1 20 true
effect give @s[type=!#minecraft:undead] instant_health 1 20 true

# process any spawned mobs (uses sr instead of mu to be compatible with survival_refightalized)
execute if score $mob_extras gm4_sr_data matches 1.. unless entity @s[tag=gm4_sr_extra_mob] as @e[type=#gm4_monsters_unbound:modify,tag=gm4_sr_extra_mob] at @s run function gm4_monsters_unbound:mob/init/initialize
tag @s remove gm4_sr_extra_mob
