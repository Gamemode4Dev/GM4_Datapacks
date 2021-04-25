# @s=golden_chestplate in cauldron
# at align xyz
# run from recipe/armor/chestplate/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:chest,AttributeName:"generic.max_health",Name:generic.max_health,Amount:6,Operation:0,UUID:[I;804844810,-704274940,-689241114,-123838463]},{Slot:chest,AttributeName:"generic.armor",Name:generic.armor,Amount:7,Operation:0,UUID:[I;515425413,-436792323,149353304,-318737482]},{Slot:chest,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;880900701,-874259622,462764530,501152564]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 2
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
