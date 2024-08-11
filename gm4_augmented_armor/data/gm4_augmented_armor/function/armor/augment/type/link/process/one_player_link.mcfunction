# process a link with 1 player
# @s = unspecified
# at unspecified
# run from armor/augment/type/link/process/loop_links

scoreboard players set $keep_tick.link gm4_aa_keep_tick 1

# set link health to this player health
execute store result storage gm4_augmented_armor:temp run_links[0].health int 1 run scoreboard players get @s gm4_sr_health.current

scoreboard players set $set_max_health gm4_aa_data 0
execute if score $link.calc_max_health gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/type/link/process/set_max_health

# remove tag
tag @s remove gm4_aa_link.process

# add this link back to storage to keep it for next tick
data modify storage gm4_augmented_armor:temp rebuild_links append from storage gm4_augmented_armor:temp run_links[0]
