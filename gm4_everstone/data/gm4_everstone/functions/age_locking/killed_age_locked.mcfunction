#run from advancement kill_age_locked
#@s = player who killed a mob holding the everstone

loot spawn ~ ~.3 ~ loot gm4_everstone:everstone
data merge entity @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_everstone:1b}}},limit=1] {PickupDelay:0}

advancement revoke @s only gm4_everstone:kill_age_locked
