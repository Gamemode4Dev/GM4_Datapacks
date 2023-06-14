# check if second_wind piece is off cooldown
# @s = player wearing armor
# at unspecified
# run from armor/check_modifier/hp_check

# get cooldown of piece
execute store result score $cooldown gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown

# check health if cooldown is ready
execute if score $cooldown gm4_ce_data matches 0 if score @s gm4_ce_health <= $half_health gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/second_wind/heal_store

# reduce cooldown if needed
execute if score $cooldown gm4_ce_data matches 1.. store success score $change gm4_ce_data store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown int 1 run scoreboard players remove $cooldown gm4_ce_data 1
