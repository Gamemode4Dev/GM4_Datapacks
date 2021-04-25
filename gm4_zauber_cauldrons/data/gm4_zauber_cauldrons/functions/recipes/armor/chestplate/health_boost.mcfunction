# @s=golden_chestplate in cauldron
# at align xyz
# run from recipe/armor/chestplate/apply_modifier.mcfunction

# Sets Zauber Armour data to storage
data modify storage gm4_zauber_cauldrons:temp/item/armour Item set value {tag:{CustomModelData:2,gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:chest,AttributeName:"generic.max_health",Name:generic.max_health,Amount:6,Operation:0,UUID:[I;804844810,-704274940,-689241114,-123838463]},{Slot:chest,AttributeName:"generic.armor",Name:generic.armor,Amount:7,Operation:0,UUID:[I;515425413,-436792323,149353304,-318737482]},{Slot:chest,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;880900701,-874259622,462764530,501152564]}]}}

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
