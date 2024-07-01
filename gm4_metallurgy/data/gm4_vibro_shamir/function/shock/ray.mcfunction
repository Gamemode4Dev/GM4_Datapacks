# @s = ray casting marker
# run from shock/ray_execute

scoreboard players add $ray gm4_vibro_shock 1
execute if block ~ ~ ~ #gm4:full_collision run scoreboard players add $ray gm4_vibro_shock 2
execute unless block ~ ~ ~ #gm4:full_collision unless block ~ ~ ~ #gm4:no_collision run scoreboard players add $ray gm4_vibro_shock 1
execute if score $ray gm4_vibro_shock matches 0..12 unless entity @a[tag=gm4_vibro_user,distance=..0.6,limit=1] positioned ^ ^ ^0.5 run function gm4_vibro_shamir:shock/ray
