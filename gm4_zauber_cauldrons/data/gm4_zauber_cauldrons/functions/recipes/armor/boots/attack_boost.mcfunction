# @s=golden_boots in cauldron
# at align xyz
# run from recipe/armor/boots/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:feet,AttributeName:"generic.attack_damage",Name:generic.attack_damage,Amount:0.35,Operation:2,UUID:[I;-728114158,242536513,454286749,553132649]},{Slot:feet,AttributeName:"generic.armor",Name:generic.armor,Amount:2,Operation:0,UUID:[I;-746125590,665119254,-889993907,-451752547]},{Slot:feet,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;109577443,-525876610,218830453,-486302541]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 3
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
