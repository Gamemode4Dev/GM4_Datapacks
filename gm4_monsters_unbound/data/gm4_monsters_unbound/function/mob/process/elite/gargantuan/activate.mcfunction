# activate gargantuan elite ground slam
# @s = gargantuan elite
# at @s
# run from mob/process/elite/check_type

attribute @s generic.follow_range modifier remove gm4_monsters_unbound:elite_buff.giant.charging
attribute @s generic.movement_speed modifier remove gm4_monsters_unbound:elite_buff.giant.charging
playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1.25 0

execute store result storage gm4_monsters_unbound:temp deal.damage float 0.75 run attribute @s generic.attack_damage get

tag @s add gm4_mu_self
execute as @a[distance=..7,gamemode=!spectator] run function gm4_monsters_unbound:mob/process/elite/gargantuan/player_hit with storage gm4_monsters_unbound:temp deal
tag @s remove gm4_mu_self

data remove storage gm4_monsters_unbound:temp deal

scoreboard players set $particle_ring gm4_mu_data 72
execute rotated 0 0 run function gm4_monsters_unbound:mob/process/elite/gargantuan/particle_ring_big

scoreboard players set @s gm4_mu_timer -6