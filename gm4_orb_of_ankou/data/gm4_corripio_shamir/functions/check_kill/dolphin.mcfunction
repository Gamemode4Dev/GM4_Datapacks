#run from advancement hurt_entity/dolphin
#@s = player who hurt a dolphin using the corripio shamir

execute if entity @s[advancements={gm4_corripio_shamir:kill_entity/dolphin=true,gm4_corripio_shamir:kill_entity/ignore_kill=false}] run loot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/dolphin ~ ~ ~ mainhand
data merge entity @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:"soul_essence"}}}},limit=1] {PickupDelay:0}

advancement revoke @s only gm4_corripio_shamir:kill_entity/ignore_kill
advancement revoke @s only gm4_corripio_shamir:kill_entity/dolphin
advancement revoke @s only gm4_corripio_shamir:hurt_entity/dolphin
