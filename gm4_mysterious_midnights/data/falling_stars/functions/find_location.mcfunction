#@s = none
#at world spawn
#called by event

#spread impact point around a random player, in a 10 chunk radius
execute at @r[gamemode=!spectator] run spreadplayers ~ ~ 0 160 false @e[type=area_effect_cloud,tag=gm4_star_impact_point]

#spawn star
execute at @e[type=area_effect_cloud,tag=gm4_star_impact_point] run function falling_stars:spawn_falling_star
