# run from advancement hurt_entity/zombified_piglin
# @s = player who hurt a zombified_piglin using the corripio shamir

loot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/zombified_piglin ~ ~ ~ mainhand
execute as @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:"soul_essence"}}}}] run data merge entity @s {PickupDelay:0}

advancement revoke @s only gm4_corripio_shamir:kill_entity/zombified_piglin
