# @s=golden_leggings in cauldron
# at align xyz
# run from recipe/armor/leggings/apply_modifier.mcfunction

# Sets Zauber Armour data to storage
data modify storage gm4_zauber_cauldrons:temp/item/armour Item set value {tag:{CustomModelData:4,gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:legs,AttributeName:"generic.movement_speed",Name:generic.movement_speed,Amount:0.12,Operation:2,UUID:[I;369107686,-99614761,-131788144,674642697]},{Slot:legs,AttributeName:"generic.armor",Name:generic.armor,Amount:5,Operation:0,UUID:[I;244610376,-831197184,-527677447,406891107]},{Slot:legs,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-628832675,284114768,-748438237,705180656]}]}}

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
