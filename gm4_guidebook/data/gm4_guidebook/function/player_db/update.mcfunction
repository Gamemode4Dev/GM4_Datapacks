# create a player db entry for this player and module
# @s = player that is being updated
# at @s
# and from gm4_guidebook:<MODULE_NAME>/rewards/unlock/*

# create if necessary (also populates unlocked pages)
$execute unless data storage gm4_guidebook:register player_pages."$(uuid)".$(name) run return run function gm4_guidebook:player_db/setup with storage gm4_guidebook:temp unlocking

# populate unlocked page
$data modify storage gm4_guidebook:register player_pages."$(uuid)".$(name).hand[$(target_page)] set from storage gm4_guidebook:register pages.$(name).hand.unlockable.$(source_page)
$data modify storage gm4_guidebook:register player_pages."$(uuid)".$(name).lectern[$(lectern_target_page)] set from storage gm4_guidebook:register pages.$(name).lectern.unlockable.$(source_page)
