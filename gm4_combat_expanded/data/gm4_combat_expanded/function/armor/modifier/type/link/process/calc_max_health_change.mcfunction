
# set health on linked piece to get player max health to average in link
scoreboard players operation $set_max_health gm4_ce_data = $link_max_health gm4_ce_data
scoreboard players operation $set_max_health gm4_ce_data -= @s gm4_ce_link_max_health
function gm4_combat_expanded:armor/modifier/type/link/process/set_max_health
