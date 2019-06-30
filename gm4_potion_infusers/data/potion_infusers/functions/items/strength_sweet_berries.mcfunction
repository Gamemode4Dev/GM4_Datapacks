#@s = player who has eaten an infused sweet berries
#run from advancement "infused_sweet_berries"

effect give @s strength 180
advancement revoke @s only potion_infusers:consume_infused_sweet_berries
