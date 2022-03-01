# @s = all non-spectator players that has a pneuma equipped
# run from main

# bubbly
execute at @s[tag=gm4_pneuma_bubbly] anchored eyes positioned ^ ^ ^ unless predicate gm4_orb_of_ankou:in_water run effect give @s water_breathing 121 0 true

# synergetic
execute at @s[tag=gm4_pneuma_synergetic] run function gm4_orb_of_ankou:pneumas/synergetic/apply

# soaring
execute at @s[tag=gm4_oa_soaring_active] run function gm4_orb_of_ankou:pneumas/soaring/apply

