# run from advancement hurt_entity/stray
# @s = player who hurt a stray using the corripio shamir

loot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/stray ~ ~ ~ mainhand
execute as @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:"soul_essence"}}}}] run data merge entity @s {PickupDelay:0}

advancement revoke @s only gm4_corripio_shamir:kill_entity/stray
