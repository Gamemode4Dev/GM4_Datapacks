# replaces the lectern with a new book
# @s = player that last opened the lectern
# at the lectern
# run from gm4_guidebook:lecterns/replace/update
# run from gm4_guidebook:lecterns/section/update/*/jump
# run from gm4_guidebook:lecterns/section/toc/jump

# replace book
## short-circuit if it's the table of contents
$execute if score $trigger gm4_guide matches 1 run return run data modify block ~ ~ ~ Book.components merge value {"minecraft:written_book_content":{"pages":$(lectern_toc),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3},"minecraft:custom_data":{gm4_guidebook:{lectern:1b,trigger:1}}}

## get unlocked pages
execute store result storage gm4_guidebook:temp book.trigger int 1 run scoreboard players get $trigger gm4_guide
function gm4_guidebook:player_db/get_trigger_name with storage gm4_guidebook:temp book
data modify storage gm4_guidebook:temp book.uuid set from entity @s UUID
function gm4_guidebook:lecterns/get_pages with storage gm4_guidebook:temp book

# update book
function gm4_guidebook:lecterns/populate with storage gm4_guidebook:temp book
data remove storage gm4_guidebook:temp book
