#@s = server
#run from metallury:pulse_check

#process players sneaking
execute as @a[tag=gm4_has_levity,scores={gm4_levity_sneak=1..}] at @s run function levity_shamir:player_sneaking

#remove floating levitation when sneaking ceases
execute as @a[tag=gm4_has_levity,scores={gm4_levity_sneak=0}] run function levity_shamir:cancel_levitation

#levitation reigon border particles
execute as @e[type=area_effect_cloud,tag=gm4_levity_epicenter] at @s run function levity_shamir:border_particles

scoreboard players set @a gm4_levity_sneak 0
