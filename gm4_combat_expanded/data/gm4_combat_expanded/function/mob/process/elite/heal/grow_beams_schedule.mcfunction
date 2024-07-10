
execute as @e[type=block_display,tag=gm4_ce_elite.heal_beam.needs_growing] at @s run function gm4_combat_expanded:mob/process/elite/heal/grow_beams
schedule function gm4_combat_expanded:mob/process/elite/heal/remove_beams 4t
