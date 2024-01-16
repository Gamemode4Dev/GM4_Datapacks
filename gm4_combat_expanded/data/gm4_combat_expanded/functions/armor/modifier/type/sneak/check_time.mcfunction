
execute store result score $current_time gm4_ce_data run time query gametime
execute store result score $stop_time gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.stop_time
execute if score $current_time gm4_ce_data >= $stop_time gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/sneak/deactivate
