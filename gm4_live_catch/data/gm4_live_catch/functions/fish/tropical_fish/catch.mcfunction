# Executes when player catches a fish
# @s = player that caught a fish
# at @s
# run from advancement, gm4_live_catch:catch_FISH_TYPE


advancement revoke @s only gm4_live_catch:catch_tropical_fish

# add fisher tag
tag @s add gm4_lc_fished_tropical_fish

# item doesnt spawn until after 1 tick
schedule function gm4_live_catch:fish/tropical_fish/target 1t
