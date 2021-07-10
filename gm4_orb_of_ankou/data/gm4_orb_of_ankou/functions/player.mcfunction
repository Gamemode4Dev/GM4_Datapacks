# @s = all non-spectator players that has a pneuma equipped
# run from main

# bubbly
execute at @s[tag=gm4_pneuma_bubbly] anchored eyes unless block ^ ^ ^ #gm4:water unless block ^ ^ ^ #gm4:waterloggable[waterlogged=true] run effect give @s water_breathing 121 0

# synergetic
execute at @s[tag=gm4_pneuma_synergetic] run function gm4_orb_of_ankou:pneumas/synergetic/apply

# soaring
execute at @s[tag=gm4_oa_soaring_active] run function gm4_orb_of_ankou:pneumas/soaring/apply

# sneaking stuff
execute if entity @s[scores={gm4_oa_sneak=0},tag=gm4_oa_sneaking] run function gm4_orb_of_ankou:pneumas/sneak/stopped
execute if entity @s[scores={gm4_oa_sneak=1..},tag=gm4_has_pneuma] run function gm4_orb_of_ankou:pneumas/sneak/check
