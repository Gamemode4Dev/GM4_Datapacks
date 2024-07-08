
# set health on linked piece to get player max health to average in link
scoreboard players operation $set_max_health gm4_ae_data = $link_max_health gm4_ae_data
scoreboard players operation $set_max_health gm4_ae_data -= @s gm4_ae_link_max_health
function gm4_armor_expanded:armor/modifier/type/link/process/set_max_health
