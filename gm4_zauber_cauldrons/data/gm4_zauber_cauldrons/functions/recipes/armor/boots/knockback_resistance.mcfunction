# @s=golden_boots in cauldron
# at align xyz
# run from recipe/armor/boots/apply_modifier.mcfunction

# Sets Zauber Armour data to storage
data modify storage gm4_zauber_cauldrons:temp/item/armour Item set value {tag:{CustomModelData:5,gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:feet,AttributeName:"generic.knockback_resistance",Name:generic.knockback_resistance,Amount:0.25,Operation:0,UUID:[I;-244063540,-946724969,-502353081,-260690505]},{Slot:feet,AttributeName:"generic.armor",Name:generic.armor,Amount:2,Operation:0,UUID:[I;-126556938,70564786,-378124159,518794193]},{Slot:feet,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;788661297,257142119,-985569927,-459662219]}]}}

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
