#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = magical_musical_jukeboxes gm4_clock_tick run function magical_musical_jukeboxes:main

execute as @e[type=item,tag=gm4_mmj_primed] at @s align xyz unless entity @e[type=armor_stand,tag=gm4_magical_musical_jukebox,limit=1,dx=0,dy=0,dz=0] positioned ~0.5 ~ ~0.5 if block ~ ~0.5 ~ minecraft:moving_piston if block ~ ~-1 ~ jukebox positioned ~ ~-1 ~ run function magical_musical_jukeboxes:create
