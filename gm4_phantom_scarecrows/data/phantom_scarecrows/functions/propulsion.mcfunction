# @s = @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket]
# at @s (updated after rotation)
# ran from aim

#move rocket forwards
tp ^ ^ ^.8
particle firework ~ ~ ~ 0 0 0 0 1 force
execute at @s unless block ~ ~ ~ #phantom_scarecrows:traversable run function phantom_scarecrows:explode
execute at @s if entity @e[type=phantom,distance=..0.5] run function phantom_scarecrows:explode
