# run from expansion/pulse_check

# check if it's moneo and add the tags
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{active_shamir:"moneo"}}}}] unless data entity @s Item.tag.MaxDurability run function gm4_moneo_shamir:store_maximum

tag @s add gm4_moneo_checked