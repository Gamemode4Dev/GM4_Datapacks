# looks for outdated cauldron markers
# @s = none
# at world spawn
# scheduled from init (only on worlds which has zauber cauldrons installed previously) and self scheduled

# target outdated markers
execute as @e[type=area_effect_cloud,tag=gm4_zauber_cauldron] at @s run function gm4_zauber_cauldrons:cauldron/structure/update/replace_marker

# self-schedule
schedule function gm4_zauber_cauldrons:cauldron/structure/update/search_for_outdated_markers 512t
