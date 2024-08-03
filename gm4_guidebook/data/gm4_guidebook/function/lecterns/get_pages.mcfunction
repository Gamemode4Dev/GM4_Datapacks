# gets the module pages
# @s = player that last opened the lectern
# at the lectern
# run from gm4_guidebook:lecterns/update

# create player db if it doesn't exist
$execute if score gm4_$(name) load.status matches 1.. unless data storage gm4_guidebook:register player_pages."$(uuid)".$(name) run function gm4_guidebook:player_db/setup with storage gm4_guidebook:temp book
# get pages for specific book
$data modify storage gm4_guidebook:temp book.pages set from storage gm4_guidebook:register player_pages."$(uuid)".$(name).lectern
