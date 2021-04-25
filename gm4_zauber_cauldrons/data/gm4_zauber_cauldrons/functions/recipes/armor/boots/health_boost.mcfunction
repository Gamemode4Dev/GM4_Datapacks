# @s=golden_boots in cauldron
# at align xyz
# run from recipe/armor/boots/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:feet,AttributeName:"generic.max_health",Name:generic.max_health,Amount:6,Operation:0,UUID:[I;173560930,227635867,-399895655,-974491959]},{Slot:feet,AttributeName:"generic.armor",Name:generic.armor,Amount:2,Operation:0,UUID:[I;-575406329,423723369,-366761868,-724931900]},{Slot:feet,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;563222043,-576739570,-109925289,-896940653]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 2
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
