# @s=golden_helmet in cauldron
# at align xyz
# run from recipe/armor/helmet/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:head,AttributeName:"generic.movement_speed",Name:generic.movement_speed,Amount:0.12,Operation:2,UUID:[I;926064265,549727827,840778481,-94658344]},{Slot:head,AttributeName:"generic.armor",Name:generic.armor,Amount:3,Operation:0,UUID:[I;204551258,685042583,911123345,430218417]},{Slot:head,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-26438964,-233002114,-533939998,-936212748]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 4
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
