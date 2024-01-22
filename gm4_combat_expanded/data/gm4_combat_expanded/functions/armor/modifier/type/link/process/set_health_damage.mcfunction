# set linked players health
# @s = linked player
# at unspecified
# run from armor/modifier/type/link/process/set_health

scoreboard players set @s gm4_ce_healstore 0

execute store result storage gm4_combat_expanded:temp damage_player.damage int -1 run scoreboard players get $health_change gm4_ce_data
function gm4_combat_expanded:player/damage with storage gm4_combat_expanded:temp damage_player

# cleanup
data remove storage gm4_combat_expanded:temp damage_player
