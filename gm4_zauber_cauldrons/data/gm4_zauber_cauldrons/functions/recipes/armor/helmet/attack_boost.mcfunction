# @s=golden_helmet in cauldron
# at align xyz
# run from recipe/armor/helmet/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:head,AttributeName:"generic.attack_damage",Name:generic.attack_damage,Amount:0.35,Operation:2,UUID:[I;250004993,-600160793,-552771284,784442588]},{Slot:head,AttributeName:"generic.armor",Name:generic.armor,Amount:3,Operation:0,UUID:[I;-440081014,-610623343,-606386611,689947835]},{Slot:head,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;807321613,318238802,-450100784,-475132420]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 3
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
