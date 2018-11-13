#@s=golden_boots in cauldron
#at align xyz
#run from recipe/armor/boots/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},display:{Lore:["§9+25% magic§r"]},AttributeModifiers:[{Slot:feet,AttributeName:generic.movementSpeed,Name:generic.movementSpeed,Amount:0.1,Operation:2,UUIDMost:55086,UUIDLeast:130867},{Slot:feet,AttributeName:generic.armor,Name:generic.armor,Amount:2,Operation:0,UUIDMost:55086,UUIDLeast:130867},{Slot:feet,AttributeName:generic.armorToughness,Name:generic.armorToughness,Amount:3,Operation:0,UUIDMost:55086,UUIDLeast:130867}]}}}
kill @e[type=item,dx=1,dy=1,dz=1,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
