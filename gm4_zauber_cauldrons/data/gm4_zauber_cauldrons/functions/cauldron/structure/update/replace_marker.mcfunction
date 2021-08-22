# replaces outdated cauldron markers with new ones
# @s = old area_effect_cloud based gm4_zauber_cauldron entities
# at @s
# run from cauldron/structure/update/search_for_outdated_markers

# kill old entity
kill @s

# summon new entity
summon marker ~ ~ ~ {CustomName:'"gm4_zauber_cauldron"',Tags:["gm4_zauber_cauldron"]}
