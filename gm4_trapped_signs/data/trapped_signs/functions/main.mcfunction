execute as @e[type=area_effect_cloud,tag=trapped_sign,tag=trapped_signs_pulsed] at @s run function trapped_signs:deactivate
execute as @e[type=area_effect_cloud,tag=trapped_sign,tag=trapped_signs_need_pulse] at @s run function trapped_signs:activate

execute as @e[type=area_effect_cloud,tag=trapped_sign] at @s unless block ~ ~ ~ #trapped_signs:signs run function trapped_signs:destroy
