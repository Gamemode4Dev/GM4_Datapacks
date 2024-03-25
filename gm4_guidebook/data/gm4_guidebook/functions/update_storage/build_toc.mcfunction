# builds the stored table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/alphabetical_sort/go

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
data merge storage gm4_guidebook:register {table_of_contents:[],trigger_order:[],toc_back:[],lectern_toc:[]}
data merge storage gm4_guidebook:temp {lectern_pages:[]}
function gm4_guidebook:update_storage/build_page

# build lectern toc pages
scoreboard players operation $click gm4_guide_pages = $front_matter gm4_guide_pages
scoreboard players add $click gm4_guide_pages 2
function gm4_guidebook:update_storage/lectern/build_page

# clean up
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:temp expansions
scoreboard players reset $trigger gm4_guide
kill @e[type=marker,tag=gm4_guide]
