# create a player db entry for this player and module
# @s = player that is being initialized
# at @s
# run from gm4_guidebook:hand/get_pages
# and from gm4_guidebook:player_db/update

# create an entry for this player and module
$data modify storage gm4_guidebook:register player_pages."$(uuid)".$(name).hand set from storage gm4_guidebook:register pages.$(name).hand.initial
$data modify storage gm4_guidebook:register player_pages."$(uuid)".$(name).lectern set from storage gm4_guidebook:register pages.$(name).lectern.initial

# find any previously unlocked pages
$function gm4_guidebook:$(name)/init_player_db
