# keep player on dashing armor stand until it touches the ground
# @s = armor stand dasher
# located at @s
# run from gm4_orb_of_ankou:pneumas/dashing/temp_tick

scoreboard players operation $current gm4_oa_id = @s gm4_oa_id
ride @a[predicate=gm4_orb_of_ankou:matching_id,distance=..5,limit=1] mount @s

kill @s[predicate=gm4_orb_of_ankou:on_ground]
