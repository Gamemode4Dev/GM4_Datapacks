# builds the stored table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:init
import json

# get all module data
data merge storage gm4_guidebook:temp {modules:[],expansions:[]}
kill @e[type=marker,tag=gm4_guide]
function #gm4_guidebook:summon_marker
execute positioned ~ 0 ~ as @e[type=marker,tag=gm4_guide,sort=furthest] run data modify storage gm4_guidebook:temp modules append from entity @s data
execute store result score $module_count gm4_guide run data get storage gm4_guidebook:temp modules
# separate expansions into their own list
data modify storage gm4_guidebook:temp expansions append from storage gm4_guidebook:temp modules[{type:"expansion"}]
data remove storage gm4_guidebook:temp modules[{type:"expansion"}]
execute store result score $expansion_count gm4_guide run data get storage gm4_guidebook:temp expansions

# build pages
scoreboard players set $toc_pages gm4_guide 0
data merge storage gm4_guidebook:register {table_of_contents:[]}
function gm4_guidebook:update_storage/build_page

# set toc pages
for i in range(20):
  page = {
    "nbt": f"table_of_contents[{i}][]",
    "storage": "gm4_guidebook:register",
    "interpret": True,
    "separator":"\n"
  }
  execute if score $toc_pages gm4_guide matches (i+1, None) run data modify storage gm4_guidebook:register toc_pages set value [json.dumps(page,separators=(',',':'))]

# clean up
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:temp expansions
