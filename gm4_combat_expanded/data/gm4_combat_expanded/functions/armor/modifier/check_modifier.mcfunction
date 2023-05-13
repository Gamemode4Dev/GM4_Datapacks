# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from functions in armor/slot/SLOT/check

# store information
execute store result score $active gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.modifier

# check activation requirements
# when undamaged for 4 seconds
execute if score $modifier gm4_ce_data matches 10..19 run function gm4_combat_expanded:armor/modifier/check_modifier/safe
# when damaged in the last 2.4 seconds (actives are triggered from advancements)
execute if score $modifier gm4_ce_data matches 20 run function gm4_combat_expanded:armor/modifier/type/damaged
# when having killed a mob in the last 0.8 seconds
execute if score $modifier gm4_ce_data matches 30..39 run function gm4_combat_expanded:armor/modifier/check_modifier/killing
# when below 50% hp
execute if score $modifier gm4_ce_data matches 40..49 run function gm4_combat_expanded:armor/modifier/check_modifier/lowhp
# when above 50% hp
execute if score $modifier gm4_ce_data matches 50..59 run function gm4_combat_expanded:armor/modifier/check_modifier/highhp
# when it is night-time
execute if score $modifier gm4_ce_data matches 60..69 run function gm4_combat_expanded:armor/modifier/check_modifier/night
# when equipped
execute if score $modifier gm4_ce_data matches 70..79 run function gm4_combat_expanded:armor/modifier/check_modifier/equip
# epic armor
execute if score $modifier gm4_ce_data matches 80.. run function gm4_combat_expanded:armor/modifier/check_modifier/epic
