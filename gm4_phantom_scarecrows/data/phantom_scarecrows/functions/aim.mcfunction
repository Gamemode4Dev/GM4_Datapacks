# @s = @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket]
# at @s
# ran from pulse_check

#homing
execute anchored eyes facing entity @e[type=minecraft:phantom,limit=1,sort=nearest] eyes run tp ~ ~ ~
execute at @s run function phantom_scarecrows:propulsion
