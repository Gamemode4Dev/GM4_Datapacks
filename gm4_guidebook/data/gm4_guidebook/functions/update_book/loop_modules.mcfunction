


data modify storage gm4_guidebook:temp module set from storage gm4_guidebook:temp modules[-1]
function #gm4_guidebook:add_pages
data modify storage gm4_guidebook:temp insert_pages append from storage gm4_guidebook:temp insert[]

data remove storage gm4_guidebook:temp module
data remove storage gm4_guidebook:temp insert
data remove storage gm4_guidebook:temp modules[-1]

execute if data storage gm4_guidebook:temp modules[-1] run function gm4_guidebook:update_book/loop_modules
