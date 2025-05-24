# creates the custom crafter in a dropper
# @s = player who opened the dropper while holding a crafting table
# located at @s
# run from advancement gm4_custom_crafters:create_custom_crafter

advancement revoke @s only gm4_custom_crafters:create_custom_crafter

# raycast to find dropper
scoreboard players set $ray gm4_count 500
execute anchored eyes positioned ^ ^ ^ run function gm4_custom_crafters:machine/craft_in_place/find_dropper
