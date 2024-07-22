
execute as @e[type=block_display,tag=gm4_ce_elite.mending_beam.needs_growing] at @s run function gm4_combat_expanded:mob/process/elite/mending/grow_beams
schedule function gm4_combat_expanded:mob/process/elite/mending/remove_beams 4t
