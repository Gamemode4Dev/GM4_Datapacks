# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

function gm4_combat_expanded:player/calculate_hp

# low hp
execute if score $modifier gm4_ce_data matches 41 if data storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}] run function gm4_combat_expanded:armor/modifier/type/thorns/check
execute if score $modifier gm4_ce_data matches 42 run function gm4_combat_expanded:armor/modifier/type/second_wind/check
execute if score $modifier gm4_ce_data matches 43 unless score @s gm4_ce_t_soothe matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/soothe/check
# either
execute if score $modifier gm4_ce_data matches 49 run function gm4_combat_expanded:armor/modifier/type/poised/check
# high hp
execute if score $modifier gm4_ce_data matches 50 run function gm4_combat_expanded:armor/modifier/type/solid/check
execute if score $modifier gm4_ce_data matches 51 if score @s gm4_ce_health > $half_health gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/immune/get_immunities
execute if score $modifier gm4_ce_data matches 52 run function gm4_combat_expanded:armor/modifier/type/half/apply
