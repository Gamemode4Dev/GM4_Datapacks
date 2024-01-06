# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

# equipped + night-time
execute if score $modifier gm4_ce_data matches 60 run function gm4_combat_expanded:armor/modifier/type/nocturnal/check
execute if score $modifier gm4_ce_data matches 61 run function gm4_combat_expanded:armor/modifier/type/lunar/check
# equipped
execute if score $modifier gm4_ce_data matches 71 run function gm4_combat_expanded:armor/modifier/type/canine/check
execute if score $modifier gm4_ce_data matches 73 at @s run function gm4_combat_expanded:armor/modifier/type/beacon/check
execute if score $modifier gm4_ce_data matches 74 on vehicle run function gm4_combat_expanded:armor/modifier/type/horse/mount
execute if score $modifier gm4_ce_data matches 75 run function gm4_combat_expanded:armor/modifier/type/husk/apply
