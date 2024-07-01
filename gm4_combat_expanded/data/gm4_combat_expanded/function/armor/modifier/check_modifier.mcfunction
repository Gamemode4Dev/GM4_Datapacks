# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from functions in armor/slot/<SLOT>

# store active information
execute store result score $active gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active
scoreboard players operation $modifier gm4_ce_data /= #100 gm4_ce_data

# check activation requirements
# when damaged in the last 2.4 seconds / undamaged for 4 seconds
execute if score $modifier gm4_ce_data matches 10..29 run function gm4_combat_expanded:armor/modifier/safety
# when having killed a mob in the last 0.8 seconds
execute if score $modifier gm4_ce_data matches 30..39 run function gm4_combat_expanded:armor/modifier/killing
# when below or above 50% hp
execute if score $modifier gm4_ce_data matches 40..59 run function gm4_combat_expanded:armor/modifier/hp_check
# when equipped
execute if score $modifier gm4_ce_data matches 60..79 run function gm4_combat_expanded:armor/modifier/equip
