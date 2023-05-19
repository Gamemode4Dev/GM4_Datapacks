# Checks player tags with Infinitas, to properly replace their item
# scheduled 1t after using an Infinitas Bucket

execute as @a[tag=gm4_infinitas_delay_replace] at @s run function gm4_infinitas_shamir:delayed_replace/check_tag
