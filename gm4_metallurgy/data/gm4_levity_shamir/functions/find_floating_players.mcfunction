#@s = server
#run from metallury:tick

#process players sneaking (checks the boots again to ensure they have not removed them)
tag @a remove gm4_levity_within_region
execute as @a[tag=gm4_has_levity,scores={gm4_levity_sneak=1..}] if predicate gm4_metallurgy:levity_active at @s run function gm4_levity_shamir:player_sneaking

#remove floating levitation when sneaking ceases
execute as @a[tag=gm4_has_levity,scores={gm4_levity_sneak=0},tag=gm4_levity_is_floating] run function gm4_levity_shamir:stop/check_cancel_buffer

#levitation reigon border particles
execute as @e[type=area_effect_cloud,tag=gm4_levity_epicenter] at @s run function gm4_levity_shamir:border_particles

scoreboard players set @a gm4_levity_sneak 0
