#run from advancement hurt_entity/pig
#@s = player who hurt a pig using the corripio shamir

execute if entity @s[advancements={gm4_corripio_shamir:kill_entity/pig=true,gm4_corripio_shamir:kill_entity/ignore_kill=false}] run loot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/pig ~ ~ ~ mainhand
data merge entity @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:"soul_essence"}}}},limit=1] {PickupDelay:0}

advancement revoke @s only gm4_corripio_shamir:kill_entity/ignore_kill
advancement revoke @s only gm4_corripio_shamir:kill_entity/pig
advancement revoke @s only gm4_corripio_shamir:hurt_entity/pig
