# handle spores
scoreboard players set $global_spore_count gm4_shroom_data 0
execute as @e[type=marker,tag=gm4_shroomite_spore] at @s run function gm4_shroomites:spore/track_age

# reschedule
schedule function gm4_shroomites:main 32t
