# starts a falling star shower
# @s = players in the overworld during a falling star night
# at @s
# run from gm4_falling_stars:event

# try to start falling stars for all players
execute as @a[tag=!gm4_falling_stars_ignore,gamemode=!spectator,x=0] at @s run function gm4_falling_stars:falling_star/start_in_area
tag @a remove gm4_falling_stars_ignore
execute as @e[type=marker,tag=gm4_falling_stars_impact_point,x=0] at @s if entity @a[gamemode=!spectator,distance=..60] positioned ~ 260 ~ run function gm4_falling_stars:falling_star/spawn

# reset fake player
scoreboard players set $shower_clock gm4_fstar_decay 0
