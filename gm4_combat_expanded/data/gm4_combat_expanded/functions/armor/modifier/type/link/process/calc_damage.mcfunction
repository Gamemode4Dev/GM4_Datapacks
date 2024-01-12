# set linked players health
# @s = linked player
# at @s
# run from armor/modifier/type/link/process/damage_taken

scoreboard players operation $damage_taken gm4_ce_data = @s gm4_ce_health
scoreboard players operation $damage_taken gm4_ce_data -= $link.health gm4_ce_data

execute store result storage gm4_combat_expanded:temp damage_player.damage int 1 run scoreboard players get $damage_taken gm4_ce_data
function gm4_combat_expanded:player/damage with storage gm4_combat_expanded:temp damage_player

# cleanup
data remove storage gm4_combat_expanded:temp damage_player
