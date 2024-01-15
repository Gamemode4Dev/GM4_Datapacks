# set player max health to 40
# @s = player wearing link armor
# at unspecified
# run from armor/modifier/tye/link/activate

# if max health is already equal to 40 this does not need to run
function gm4_combat_expanded:player/calculate_hp
execute if score @s gm4_ce_health.max matches 40 run return 1

# mark for change
scoreboard players set $change gm4_ce_data 1

# change max health modifier on the armor
execute store result score $curr_health_mod gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount
scoreboard players set $max_health_change gm4_ce_data 40
scoreboard players operation $max_health_change gm4_ce_data -= @s gm4_ce_health.max
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount float 1 run scoreboard players operation $curr_health_mod gm4_ce_data += $max_health_change gm4_ce_data
