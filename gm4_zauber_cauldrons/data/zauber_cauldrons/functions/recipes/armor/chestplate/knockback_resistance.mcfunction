#@s=golden_chestplate in cauldron
#at align xyz
#run from recipe/armor/chestplate/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},display:{Lore:["{\"text\":\"+25% Magic\",\"color\":\"blue\",\"italic\":\"false\"}"]},AttributeModifiers:[{Slot:chest,AttributeName:generic.knockbackResistance,Name:generic.knockbackResistance,Amount:0.25,Operation:0,UUIDMost:55086,UUIDLeast:130875},{Slot:chest,AttributeName:generic.armor,Name:generic.armor,Amount:7,Operation:0,UUIDMost:55086,UUIDLeast:130875},{Slot:chest,AttributeName:generic.armorToughness,Name:generic.armorToughness,Amount:3,Operation:0,UUIDMost:55086,UUIDLeast:130875}]}}}
kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
