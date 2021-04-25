# @s=golden_leggings in cauldron
# at align xyz
# run from recipe/armor/leggings/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:legs,AttributeName:"generic.knockback_resistance",Name:generic.knockback_resistance,Amount:0.25,Operation:0,UUID:[I;773912078,704402546,202619636,954471299]},{Slot:legs,AttributeName:"generic.armor",Name:generic.armor,Amount:5,Operation:0,UUID:[I;782007122,-25028284,588185585,-107321181]},{Slot:legs,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;948504386,107979224,-95861344,-432571820]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 5
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
