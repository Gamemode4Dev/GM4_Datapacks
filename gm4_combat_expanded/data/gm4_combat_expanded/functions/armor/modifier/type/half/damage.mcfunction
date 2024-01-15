# damage player if above half health
# @s = player wearing half armour
# at unspecified
# run from armor/modifier/type/half/apply

scoreboard players operation $remove_health gm4_ce_data = @s gm4_ce_health.current
execute store result storage gm4_combat_expanded:temp damage_player.damage int 1 run scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health.max_half
function gm4_combat_expanded:player/damage with storage gm4_combat_expanded:temp damage_player
data remove storage gm4_combat_expanded:temp damage_player
