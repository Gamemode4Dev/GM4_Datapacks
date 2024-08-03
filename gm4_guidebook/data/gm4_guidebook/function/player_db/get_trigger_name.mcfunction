# gets the module name based on the trigger number
# @s = player that triggers gm4_guide
# at @s
# run from gm4_guidebook:hand/update
# and from gm4_guidebook:lectern/update

$data modify storage gm4_guidebook:temp book.name set from storage gm4_guidebook:register trigger_map.$(trigger)
