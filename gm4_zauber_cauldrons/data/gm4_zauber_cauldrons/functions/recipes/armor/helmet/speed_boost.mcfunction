# @s=golden_helmet in cauldron
# at align xyz
# run from recipe/armor/helmet/apply_modifier.mcfunction

# Sets Zauber Armour data to storage
data modify storage gm4_zauber_cauldrons:temp/item/armour Item set value {tag:{CustomModelData:4,gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:head,AttributeName:"generic.movement_speed",Name:generic.movement_speed,Amount:0.12,Operation:2,UUID:[I;926064265,549727827,840778481,-94658344]},{Slot:head,AttributeName:"generic.armor",Name:generic.armor,Amount:3,Operation:0,UUID:[I;204551258,685042583,911123345,430218417]},{Slot:head,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-26438964,-233002114,-533939998,-936212748]}]}}

# Merge item data into the temporary storage to carry over CMD and similar tags
data modify storage gm4_zauber_cauldrons:temp/item/armour Item merge from entity @s Item

# Place Zauber Armor lore before existing lines
data modify storage gm4_zauber_cauldrons:temp/item/armour Item.tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

# Merge storage data back into item
data modify entity @s Item set from storage gm4_zauber_cauldrons:temp/item/armour Item
data merge entity @s {PickupDelay:0}

# Destroy incredients and complete recipe
kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
