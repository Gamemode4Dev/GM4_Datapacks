# Spawns a new version of the item from a loot table and deletes the old item entity
# @s = player head with a match in the registry
# at @s
# run from found_match

kill @s
$loot spawn ~ ~ ~ loot $(loot_table)
