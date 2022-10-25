

advancement revoke @s only gm4_infinitas_shamir:bucket_inventory_change
advancement revoke @s only gm4_infinitas_shamir:rejoin_bucket_check

advancement revoke @s only gm4_infinitas_shamir:empty/pickup_mainhand
advancement revoke @s only gm4_infinitas_shamir:empty/pickup_offhand

advancement revoke @s only gm4_infinitas_shamir:milk/drink_mainhand
advancement revoke @s only gm4_infinitas_shamir:milk/drink_offhand

advancement revoke @s only gm4_infinitas_shamir:powder_snow/place_mainhand
advancement revoke @s only gm4_infinitas_shamir:powder_snow/place_ofhand

advancement revoke @s only gm4_infinitas_shamir:water/pickup_mainhand
advancement revoke @s only gm4_infinitas_shamir:water/pickup_offhand
advancement revoke @s only gm4_infinitas_shamir:water/place_mainhand
advancement revoke @s only gm4_infinitas_shamir:water/place_offhand


scoreboard players reset @s gm4_infinitas_leave
scoreboard players reset @s gm4_infinitas_success_check

tag @s remove gm4_infinitas_delay_replace_empty
tag @s remove gm4_infinitas_delay_replace_fish
tag @s remove gm4_infinitas_delay_replace_milk
tag @s remove gm4_infinitas_delay_replace_powder_snow
tag @s remove gm4_infinitas_delay_replace_water

tag @s add gm4_has_empty_infinitas
tag @s add gm4_has_water_infinitas


function gm4_infinitas_shamir:clock/inventory_check
