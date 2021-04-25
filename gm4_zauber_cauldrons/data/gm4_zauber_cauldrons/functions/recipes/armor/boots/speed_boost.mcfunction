# @s=golden_boots in cauldron
# at align xyz
# run from recipe/armor/boots/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:feet,AttributeName:"generic.movement_speed",Name:generic.movement_speed,Amount:0.12,Operation:2,UUID:[I;-381940460,932551270,-256402379,147935837]},{Slot:feet,AttributeName:"generic.armor",Name:generic.armor,Amount:2,Operation:0,UUID:[I;-98045056,-801979198,171681426,-388316722]},{Slot:feet,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-108640928,-19939055,547652436,-796028868]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 4
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
