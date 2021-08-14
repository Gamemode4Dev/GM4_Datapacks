# checks whether @s is a custom sapling, and if so allows further execution
# @s any gm4_fruiting_sapling
# at @s align xyz
# run from #gm4_fruiting_trees:tree/initialize

scoreboard players set seed_mode_sapling gm4_gv_gen_data 1

execute if entity @s[tag=gm4_king_palm_sapling] run function gm4_garden_variety_trees:generate/king_palm/generate
