# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 40 run function gm4_combat_expanded:armor/modifier/type/lowhp
execute if score $modifier gm4_ce_data matches 41 if data storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}] run function gm4_combat_expanded:armor/modifier/type/thorns/check
execute if score $modifier gm4_ce_data matches 42 run function gm4_combat_expanded:armor/modifier/type/second_wind/check
execute if score $modifier gm4_ce_data matches 43 unless score @s gm4_ce_t_soothe matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/soothe/check
