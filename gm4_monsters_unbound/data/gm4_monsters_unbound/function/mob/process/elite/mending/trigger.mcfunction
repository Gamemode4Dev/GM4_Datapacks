# heal this undead
# @s = undead near mending elite
# at @s
# run from mob/process/elite/mending/check_los_raycast

scoreboard players set $target_healed gm4_mu_data 1

effect give @s instant_damage 1 2 false
effect give @s resistance 1 1 false
particle heart ^ ^ ^ 0.2 0.2 0.2 0.05 1

playsound minecraft:item.bottle.fill hostile @a ~ ~ ~ 0.7 2

execute summon block_display run function gm4_monsters_unbound:mob/process/elite/mending/init_beam
schedule function gm4_monsters_unbound:mob/process/elite/mending/grow_beams_schedule 1t

scoreboard players reset $raycast_travel_distance gm4_mu_data
