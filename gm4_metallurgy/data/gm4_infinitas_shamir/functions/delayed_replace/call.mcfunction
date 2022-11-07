# Checks player tags with Infinitas, to properly replace their item
# scheduled 1t after using an Infinitas Bucket

execute as @a[tag=gm4_has_infinitas] at @s run function gm4_infinitas_shamir:delayed_replace/check_tag
