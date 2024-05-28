
execute store result score $curr_time gm4_ce_data run time query gametime
execute store result score $deactivates_at gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.deactivates_at
execute if score $curr_time gm4_ce_data >= $deactivates_at gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/reckless/deactivate
