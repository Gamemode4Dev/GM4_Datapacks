# schedule to grow the healing beam
# @s = unspecified
# at unspecified
# schedule from mob/process/elite/mending/trigger

execute as @e[type=block_display,tag=gm4_mu_elite.mending_beam.needs_growing] at @s run function gm4_monsters_unbound:mob/process/elite/mending/grow_beams
schedule function gm4_monsters_unbound:mob/process/elite/mending/remove_beams 4t