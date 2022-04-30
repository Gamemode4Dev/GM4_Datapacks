# check if second_wind piece is off cooldown
# @s = player wearing armor
# run from armor/check_modifier

# get cooldown of piece
execute store result score $cooldown gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown

# check health if cooldown is ready
execute if score $cooldown gm4_ce_data matches 0 run function gm4_combat_evolved:armor/modifiers/type/second_wind/heal_check

# reduce cooldown if needed
execute if score $cooldown gm4_ce_data matches 1.. store success score $change gm4_ce_data store result storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown int 1 run scoreboard players remove $cooldown gm4_ce_data 1
