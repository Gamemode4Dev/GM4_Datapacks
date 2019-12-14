# @s = player with the defuse shamir in inventory
# run from metallurgy:has_shamir

tag @s add gm4_trying_to_defuse
execute at @s[nbt={Inventory:[{Slot:103b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] run function gm4_defuse_shamir:defuse_mobs
execute if entity @s[tag=gm4_trying_to_defuse] at @s[nbt={Inventory:[{Slot:102b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] run function gm4_defuse_shamir:defuse_mobs
execute if entity @s[tag=gm4_trying_to_defuse] at @s[nbt={Inventory:[{Slot:101b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] run function gm4_defuse_shamir:defuse_mobs
execute if entity @s[tag=gm4_trying_to_defuse] at @s[nbt={Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] run function gm4_defuse_shamir:defuse_mobs
tag @s remove gm4_trying_to_defuse
