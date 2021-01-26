#run from advancement hurt_entity/phantom
#@s = player who hurt a phantom using the corripio shamir

execute if entity @s[advancements={gm4_corripio_shamir:kill_entity/phantom=true,gm4_corripio_shamir:kill_entity/ignore_kill=false}] run loot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/phantom ~ ~ ~ mainhand
data merge entity @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:"soul_essence"}}}},limit=1] {PickupDelay:0}

advancement revoke @s only gm4_corripio_shamir:kill_entity/ignore_kill
advancement revoke @s only gm4_corripio_shamir:kill_entity/phantom
advancement revoke @s only gm4_corripio_shamir:hurt_entity/phantom
