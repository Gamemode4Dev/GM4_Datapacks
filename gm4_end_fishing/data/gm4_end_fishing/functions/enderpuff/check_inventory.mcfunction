# @s = any player who has changed their inventory
# run from advancement "check_inventory"

advancement revoke @s only gm4_end_fishing:check_inventory

tag @s remove gm4_has_enderpuff
tag @s[nbt={Inventory:[{tag:{gm4_end_fishing:{enderpuff:1b}}}]}] add gm4_has_enderpuff
