# check if time of attack speed has ran out
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sneak/check

execute store result score $current_time gm4_ce_data run time query gametime
execute store result score $stop_time gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.stop_time
execute if score $current_time gm4_ce_data >= $stop_time gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/sneak/deactivate
