#@s = player who has eaten an infused melon slice
#run from advancement "consume_infused_melon_slice"

effect give @s instant_health
advancement revoke @s only potion_infusers:consume_infused_melon_slice
