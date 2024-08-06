# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from amor/modifier/type/link/check
# schedule from here

scoreboard players set $keep_tick.link gm4_aa_keep_tick 0
# calculate hp for all players in this link
execute as @a[tag=gm4_aa_linked] run function gm4_survival_refightalized:player/calculate_hp

# get links into storage
data modify storage gm4_augmented_armor:temp run_links set from storage gm4_augmented_armor:data active_links

# always keep first entry, it is for unlicked (licked? yes, licked) linked pieces
data modify storage gm4_augmented_armor:temp rebuild_links set value []
data modify storage gm4_augmented_armor:temp rebuild_links append from storage gm4_augmented_armor:temp run_links[0]
data remove storage gm4_augmented_armor:temp run_links[0]

# process active links
execute if data storage gm4_augmented_armor:temp run_links[0] run function gm4_augmented_armor:armor/modifier/type/link/process/loop_links

# put any still active links back
data modify storage gm4_augmented_armor:data active_links set from storage gm4_augmented_armor:temp rebuild_links
data remove storage gm4_augmented_armor:temp rebuild_links

# only calc max health stuff once per 16t
scoreboard players set $link.calc_max_health gm4_aa_data 0

execute if score $keep_tick.link gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/link 1t
