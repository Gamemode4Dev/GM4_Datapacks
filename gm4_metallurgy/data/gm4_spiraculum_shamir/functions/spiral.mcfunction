#run from spiraculum_shamir:main
#@s = players holding a spiraculum bucket

execute positioned ~ ~-1 ~1 as @e[tag=gm4_in_spiraculum,dx=5,dy=2,dz=4] run data merge entity @s {Motion:[-0.9d,0.0d,-0.1d]}
execute positioned ~-1 ~-1 ~ as @e[tag=gm4_in_spiraculum,dx=-4,dy=2,dz=5] run data merge entity @s {Motion:[0.1d,0.0d,-0.9d]}
execute positioned ~ ~-1 ~-1 as @e[tag=gm4_in_spiraculum,dx=-5,dy=2,dz=-4] run data merge entity @s {Motion:[0.9d,0.0d,0.1d]}
execute positioned ~1 ~-1 ~ as @e[tag=gm4_in_spiraculum,dx=4,dy=2,dz=-5] run data merge entity @s {Motion:[-0.1d,0.0d,0.9d]}
