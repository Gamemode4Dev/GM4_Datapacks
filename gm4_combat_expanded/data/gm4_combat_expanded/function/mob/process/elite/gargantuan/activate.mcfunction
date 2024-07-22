
attribute @s generic.movement_speed modifier remove gm4_combat_expanded:elite_buff.giant.charging
playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1.25 0

execute store result storage gm4_combat_expanded:temp deal.damage float 0.75 run attribute @s generic.attack_damage get

tag @s add gm4_ce_self
execute as @a[distance=..7,gamemode=!spectator] run function gm4_combat_expanded:mob/process/elite/gargantuan/player_hit with storage gm4_combat_expanded:temp deal
tag @s remove gm4_ce_self

data remove storage gm4_combat_expanded:temp deal

scoreboard players set $particle_ring gm4_ce_data 72
execute rotated 0 0 run function gm4_combat_expanded:mob/process/elite/gargantuan/particle_ring_big

scoreboard players set @s gm4_ce_timer -6
