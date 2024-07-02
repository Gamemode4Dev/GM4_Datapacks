# damage player if above half health
# @s = player wearing half armour
# at unspecified
# run from armor/modifier/type/half/apply

scoreboard players operation $damage_health gm4_ce_data = @s gm4_ce_health.current
scoreboard players operation $damage_health gm4_ce_data -= @s gm4_ce_health.max_half
execute if score $damage_health gm4_ce_data matches 1.. run function gm4_combat_expanded:player/health/reduce/activate
