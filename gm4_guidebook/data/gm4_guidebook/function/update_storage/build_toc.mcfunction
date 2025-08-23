# builds the stored table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/setup_markers

# get all module data
data merge storage gm4_guidebook:temp {modules:[],expansions:[]}
execute positioned ~ 0 ~ as @e[type=marker,tag=gm4_guide,sort=furthest] run data modify storage gm4_guidebook:temp modules append from entity @s data
execute store result score $module_count gm4_guide run data get storage gm4_guidebook:temp modules
# separate expansions into their own list
data modify storage gm4_guidebook:temp expansions append from storage gm4_guidebook:temp modules[{type:"expansion"}]
data remove storage gm4_guidebook:temp modules[{type:"expansion"}]
execute store result score $expansion_count gm4_guide run data get storage gm4_guidebook:temp expansions

# build pages
scoreboard players operation $front_matter gm4_guide_pages = #intro gm4_guide_pages
data modify storage gm4_guidebook:temp prev_trigger_order set from storage gm4_guidebook:register trigger_order
data merge storage gm4_guidebook:register {table_of_contents:[],trigger_order:[],lectern_toc:[["",{"translate":"gui.gm4.guidebook.page.toc","fallback":"","color":"white","font":"gm4:guidebook"}],["",{"translate":"gui.gm4.guidebook.page.intro","fallback": "","color": "white","font": "gm4:guidebook"},{"translate":"text.gm4.guidebook.introduction","fallback":"Introduction","underlined":true},{"text":"\n\n"},{"translate":"text.gm4.guidebook.letter","fallback":"This is a world unlike others. It appears that certain things work...differently to say the least.\n\nThis book will document discoveries regarding these new mechanics."},{"text":"\n\n> ","color":"#4AA0C7"},{"translate":"text.gm4.guidebook.refresh_findings","fallback":"Refresh Findings","color":"#4AA0C7","hover_event":{"action":"show_text","value":[{"translate":"text.gm4.guidebook.refresh_toc","fallback":"Refresh Table of Contents","color":"gold"}]},"click_event":{"action":"change_page","page":1}}]]}
data merge storage gm4_guidebook:temp {lectern_pages:[],toc_back:[]}
function gm4_guidebook:update_storage/build_page

# build lectern toc pages
scoreboard players operation $click gm4_guide_pages = $front_matter gm4_guide_pages
execute store result storage gm4_guidebook:temp click int 1 run scoreboard players add $click gm4_guide_pages 2
function gm4_guidebook:update_storage/lectern/build_page
data modify storage gm4_guidebook:register lectern_toc append from storage gm4_guidebook:temp toc_back[]

# check if modules changed
scoreboard players set $updated gm4_guide 0
execute store success score $updated gm4_guide run data modify storage gm4_guidebook:temp prev_trigger_order set from storage gm4_guidebook:register trigger_order
execute if score $updated gm4_guide matches 1 run data remove storage gm4_guidebook:register player_pages

# clean up
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:temp expansions
data remove storage gm4_guidebook:temp toc_back
data remove storage gm4_guidebook:temp lectern_pages
data remove storage gm4_guidebook:temp prev_trigger_order
data remove storage gm4_guidebook:temp click
scoreboard players reset $trigger gm4_guide
kill @e[type=marker,tag=gm4_guide]
