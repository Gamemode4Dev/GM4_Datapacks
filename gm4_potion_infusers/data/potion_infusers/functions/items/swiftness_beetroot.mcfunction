#@s = player who has eaten an infused beetroot
#run from advancement "consume_infused_beetroot"

effect give @s speed 180
advancement revoke @s only potion_infusers:consume_infused_beetroot
