#@s=golden_helmet in cauldron
#at align xyz
#run from recipe/armor/helmet/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},display:{Lore:["§9+25% magic§r"]},AttributeModifiers:[{Slot:head,AttributeName:generic.knockbackResistance,Name:generic.knockbackResistance,Amount:0.25,Operation:0,UUIDMost:55086,UUIDLeast:130874},{Slot:head,AttributeName:generic.armor,Name:generic.armor,Amount:3,Operation:0,UUIDMost:55086,UUIDLeast:130874},{Slot:head,AttributeName:generic.armorToughness,Name:generic.armorToughness,Amount:3,Operation:0,UUIDMost:55086,UUIDLeast:130874}]}}}
kill @e[type=item,dx=1,dy=1,dz=1,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
