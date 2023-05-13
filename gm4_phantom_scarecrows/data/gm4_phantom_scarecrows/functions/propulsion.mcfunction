# @s = @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket]
# at @s (updated after rotation)
# ran from aim

#move rocket forwards
tp ^ ^ ^.8
particle firework ~ ~ ~ 0 0 0 0 1 force
execute at @s unless block ~ ~ ~ #gm4:no_collision run function gm4_phantom_scarecrows:explode
execute at @s if entity @e[type=phantom,tag=!smithed.entity,distance=..0.5] run function gm4_phantom_scarecrows:explode
