# @s = any player who has a soul shard or orb of ankou in their offhand
# run from update_tags/check_offhand

tag @s add gm4_has_pneuma

tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/aggressive] add gm4_pneuma_aggressive
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/agile] add gm4_pneuma_agile
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/bargaining] add gm4_pneuma_bargaining
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/blasting] add gm4_pneuma_blasting
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/blinding] add gm4_pneuma_blinding
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/bounding] add gm4_pneuma_bounding
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/bubbly] add gm4_pneuma_bubbly
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/conjuring] add gm4_pneuma_conjuring
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/draining] add gm4_pneuma_draining
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/expeditious] add gm4_pneuma_expeditious
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/feathery] add gm4_pneuma_feathery
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/feigning] add gm4_pneuma_feigning
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/gazing] add gm4_pneuma_gazing
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/gliding] add gm4_pneuma_gliding
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/hawkeye] add gm4_pneuma_hawkeye
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/incombustible] add gm4_pneuma_incombustible
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/lifeless] add gm4_pneuma_lifeless
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/neutralizing] add gm4_pneuma_neutralizing
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/phasing] add gm4_pneuma_phasing
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/retreating] add gm4_pneuma_retreating
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/rushing] add gm4_pneuma_rushing
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/scaling] add gm4_pneuma_scaling
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/shrieking] add gm4_pneuma_shrieking
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/soaring] add gm4_pneuma_soaring
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/striding] add gm4_pneuma_striding
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/synergetic] add gm4_pneuma_synergetic
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/vanishing] add gm4_pneuma_vanishing
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/volatile] add gm4_pneuma_volatile
tag @s[predicate=gm4_orb_of_ankou:pneuma_equipped/withering] add gm4_pneuma_withering

tag @s[tag=gm4_pneuma_bounding] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_rushing] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_conjuring] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_expeditious] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_draining] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_shrieking] add gm4_sneak_pneuma

# run tick functions
execute if entity @a[gamemode=!spectator,tag=gm4_pneuma_agile,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/agile 1t
execute if entity @a[gamemode=!spectator,tag=gm4_pneuma_hawkeye,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/hawkeye 1t
execute if entity @a[gamemode=!spectator,tag=gm4_pneuma_striding,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/striding 1t
