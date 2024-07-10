
particle flame ~ ~ ~ 0.01 0.01 0.01 0.1 32
particle flame ~ ~ ~ 0.075 0.075 0.075 0.025 12

playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 1 1.4
playsound item.firecharge.use hostile @a ~ ~ ~ 1 0.7

# hit players
execute positioned ~-.22 ~-.22 ~-.22 as @a[dx=0,dy=0,dz=0] positioned ~-0.34 ~-0.34 ~-0.34 run damage @s[dx=0,dy=0,dz=0] 5 explosion

kill @s
