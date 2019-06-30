#@s = player who has eaten an infused carrot
#run from advancement "consume_infused_carrot"

effect give @s night_vision 180
advancement revoke @s only potion_infusers:consume_infused_carrot
