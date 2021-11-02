# Executes when player catches a fish
# @s = player that caught a fish
# at @s
# run from advancement, gm4_live_catch:catch_FISH_TYPE


advancement revoke @s only gm4_live_catch:catch_pufferfish

# advancement
advancement grant @s only gm4:live_catch

# add fisher tag
tag @s add gm4_lc_fished_pufferfish

# item doesnt spawn until after 1 tick
schedule function gm4_live_catch:fish/pufferfish/target 1t
