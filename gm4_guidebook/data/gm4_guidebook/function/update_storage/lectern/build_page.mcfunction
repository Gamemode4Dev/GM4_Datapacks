# builds each page of the lectern table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/build_toc
# run from self

# build module lines
data merge storage gm4_guidebook:temp {page:[["",{"translate":"gui.gm4.guidebook.page.toc","fallback":"","color":"white","font":"gm4:guidebook"}]]}
function gm4_guidebook:update_storage/lectern/build_line

# add table of contents page
data modify block 29999998 1 7133 front_text.messages[0] set value {"nbt": "page[]","storage": "gm4_guidebook:temp","interpret": True,"separator":"\n"}
data modify storage gm4_guidebook:register lectern_toc append from block 29999998 1 7133 front_text.messages[0]

# loop for all modules
data remove storage gm4_guidebook:temp lectern_pages[0]
execute if data storage gm4_guidebook:temp lectern_pages[-1] run function gm4_guidebook:update_storage/lectern/build_page
