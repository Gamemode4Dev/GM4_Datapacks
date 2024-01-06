# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from functions in armor/slot/<SLOT>

# store information
execute store result score $active gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.modifier

# check activation requirements
# when damaged in the last 2.4 seconds / undamaged for 4 seconds
execute if score $modifier gm4_ce_data matches 10..19 run function gm4_combat_expanded:armor/modifier/check_modifier/safety
# when having killed a mob in the last 0.8 seconds
execute if score $modifier gm4_ce_data matches 30..39 run function gm4_combat_expanded:armor/modifier/check_modifier/killing
# when below or above 50% hp
execute if score $modifier gm4_ce_data matches 40..59 run function gm4_combat_expanded:armor/modifier/check_modifier/hp_check
# when equipped / when it is night-time
execute if score $modifier gm4_ce_data matches 60..69 run function gm4_combat_expanded:armor/modifier/check_modifier/equip
