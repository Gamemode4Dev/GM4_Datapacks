# run from advancement, gm4_live_catch:catch_FISH_TYPE


advancement revoke @s only gm4_live_catch:catch_salmon

# add fisher tag
tag @s add gm4_lc_fisher

# item doesnt spawn until after 1 tick
schedule function gm4_live_catch:fish/salmon/target 1t
