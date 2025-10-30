# @s = gm4_llp_unwaxed_copper_lantern block display
# at associated interaction
# run from mechanics/interactions/unwaxed_copper_lantern/process_interaction

scoreboard players set $interaction_processed gm4_llp.data 0

# if mainhand honeycomb, wax
execute if score $interaction_processed gm4_llp.data matches 0 if score $mainhand gm4_llp.data matches 2 store success score $interaction_processed gm4_llp.data run scoreboard players set $wax_used gm4_llp.data 1
# if no neither item in mainhand, but honeycomb in offhand, wax
execute if score $interaction_processed gm4_llp.data matches 0 if score $mainhand gm4_llp.data matches 0 if score $offhand gm4_llp.data matches 2 store success score $interaction_processed gm4_llp.data run scoreboard players set $wax_used gm4_llp.data 2

# check if can scrape
execute if score $interaction_processed gm4_llp.data matches 0 store success score $can_scrape gm4_llp.data unless data entity @s {block_state:{Name:"minecraft:copper_lantern"}}
# if cant scrape, but offhand honeycomb, wax
execute if score $interaction_processed gm4_llp.data matches 0 if score $can_scrape gm4_llp.data matches 0 if score $offhand gm4_llp.data matches 2 store success score $interaction_processed gm4_llp.data run scoreboard players set $wax_used gm4_llp.data 2

# if can scrape and mainhand axe, scrape
execute if score $interaction_processed gm4_llp.data matches 0 if score $can_scrape gm4_llp.data matches 1 if score $mainhand gm4_llp.data matches 1 store success score $interaction_processed gm4_llp.data run scoreboard players set $axe_used gm4_llp.data 1
# if can scrape and offhand axe, scrape
execute if score $interaction_processed gm4_llp.data matches 0 if score $can_scrape gm4_llp.data matches 1 if score $offhand gm4_llp.data matches 1 store success score $interaction_processed gm4_llp.data run scoreboard players set $axe_used gm4_llp.data 2

# fail if nothing to do
execute if score $interaction_processed gm4_llp.data matches 0 run return fail

# modify display
execute if score $wax_used gm4_llp.data matches 1..2 run function gm4_lively_lily_pads:mechanics/interactions/unwaxed_copper_lantern/wax_display
execute if score $axe_used gm4_llp.data matches 1..2 run function gm4_lively_lily_pads:mechanics/interactions/unwaxed_copper_lantern/scrape_display
