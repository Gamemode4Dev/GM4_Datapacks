
scoreboard players set $player_hit gm4_ce_data 1

particle dust{color:[0.000,0.000,0.000],scale:1} ~ ~ ~ 0.0666 0.0666 0.0666 2 6 normal

playsound minecraft:entity.witch.celebrate hostile @s ~ ~ ~ 1 2
playsound minecraft:entity.witch.death hostile @s ~ ~ ~ 1 0.666

scoreboard players set $freeze_seconds gm4_ce_data 5
function gm4_combat_expanded:effect/freeze/apply
