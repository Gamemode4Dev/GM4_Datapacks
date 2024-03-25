# saves the tags into a list of strings
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/alphabetical_sort/get_next_tag

$data modify storage gm4_guidebook:temp sort.tags append string storage gm4_guidebook:temp sort.orig 0 $(last)
