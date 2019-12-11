#@s=golden_leggings in cauldron
#at align xyz
#run from recipe/armor/leggings/apply_modifier.mcfunction

data merge entity @s {CustomModelData:2,PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},display:{Lore:['{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue"}']},AttributeModifiers:[{Slot:legs,AttributeName:generic.knockbackResistance,Name:generic.knockbackResistance,Amount:0.25,Operation:0,UUIDMost:55086,UUIDLeast:130876},{Slot:legs,AttributeName:generic.armor,Name:generic.armor,Amount:5,Operation:0,UUIDMost:55086,UUIDLeast:130876},{Slot:legs,AttributeName:generic.armorToughness,Name:generic.armorToughness,Amount:3,Operation:0,UUIDMost:55086,UUIDLeast:130876}]}}}
kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
