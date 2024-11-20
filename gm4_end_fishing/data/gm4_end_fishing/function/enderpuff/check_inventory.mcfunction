# @s = any player who has changed their inventory
# run from advancement "check_inventory"

advancement revoke @s only gm4_end_fishing:check_inventory

tag @s remove gm4_has_enderpuff
tag @s[predicate=gm4_end_fishing:carries_enderpuff] add gm4_has_enderpuff
