# @s=golden_leggings in cauldron
# at align xyz
# run from recipe/armor/leggings/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:legs,AttributeName:"generic.movement_speed",Name:generic.movement_speed,Amount:0.12,Operation:2,UUID:[I;369107686,-99614761,-131788144,674642697]},{Slot:legs,AttributeName:"generic.armor",Name:generic.armor,Amount:5,Operation:0,UUID:[I;244610376,-831197184,-527677447,406891107]},{Slot:legs,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-628832675,284114768,-748438237,705180656]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 4
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
