# set linked players health
# @s = linked player
# at @s
# run from armor/modifier/type/link/process/damage_taken

scoreboard players operation $health_change gm4_ce_data = @s gm4_ce_health.current
scoreboard players operation $health_change gm4_ce_data -= $link_health gm4_ce_data

function gm4_combat_expanded:player/damage/activate
