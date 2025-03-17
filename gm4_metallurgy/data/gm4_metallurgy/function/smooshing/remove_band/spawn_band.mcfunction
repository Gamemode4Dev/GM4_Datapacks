$execute store result score $valid_obsidian gm4_ml_data run loot spawn ~ ~ ~ loot gm4_$(active_shamir)_shamir:band

tag @n[type=item,nbt={Age:0s}] add gm4_ml_smooshed

kill @e[type=item,dx=0,predicate=gm4_metallurgy:is_obsidian,limit=1]
