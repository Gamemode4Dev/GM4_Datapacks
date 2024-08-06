
# set health on linked piece to get player max health to average in link
scoreboard players operation $set_max_health gm4_aa_data = $link_max_health gm4_aa_data
scoreboard players operation $set_max_health gm4_aa_data -= @s gm4_aa_link_max_health
function gm4_augmented_armor:armor/modifier/type/link/process/set_max_health
