# gets the module pages
# @s = player that triggers gm4_guide
# at @s
# run from gm4_guidebook:hand/update

# short circuit if the module isn't loaded
$execute unless score $(load) load.status matches 1.. run return 0
# create player db if it doesn't exist
$execute unless data storage gm4_guidebook:register player_pages."$(uuid)".$(name) run function gm4_guidebook:player_db/setup with storage gm4_guidebook:temp book
# get pages for specific book
$data modify storage gm4_guidebook:temp book.pages set from storage gm4_guidebook:register player_pages."$(uuid)".$(name).hand
