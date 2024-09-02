# explode volatile pillar
# @s = pillar marker
# at @s
# run from mob/process/elite/volatile/pillar_process

execute positioned ~-2 ~-1 ~-2 as @a[gamemode=!spectator,dx=4,dy=12,dz=4] run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_damage
kill @s
particle minecraft:dragon_breath ~ ~ ~ 0.2 0.2 0.2 0.33 64
particle minecraft:dragon_breath ~ ~0.25 ~ 0.5 0.5 0.5 0 32
particle minecraft:dragon_breath ~ ~5 ~ 0.2 8 0.2 1 32
playsound entity.dragon_fireball.explode hostile @a[distance=..32] ~ ~ ~ 1 0.9 0.5
