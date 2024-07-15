
effect give @s instant_damage 1 2 false
effect give @s resistance 1 1 false
particle heart ^ ^ ^ 0.2 0.2 0.2 0.05 1

playsound minecraft:item.bottle.fill hostile @a ~ ~ ~ 0.7 2

execute summon block_display run function gm4_combat_expanded:mob/process/elite/heal/init_beam
schedule function gm4_combat_expanded:mob/process/elite/heal/grow_beams_schedule 1t

scoreboard players reset $raycast_travel_distance gm4_ce_data
