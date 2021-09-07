# @s = any player who has changed their inventory
# run from advancement "check_player/check_inventory"

advancement revoke @s only gm4_orb_of_ankou:check_player/check_inventory

execute if entity @s[tag=gm4_has_pneuma] run function gm4_orb_of_ankou:update_tags/remove_tags

execute if entity @s[predicate=gm4_orb_of_ankou:has_pneuma] run function gm4_orb_of_ankou:update_tags/check_pneuma
