# @s=golden_leggings in cauldron
# at align xyz
# run from recipe/armor/leggings/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:legs,AttributeName:"generic.max_health",Name:generic.max_health,Amount:6,Operation:0,UUID:[I;-591878888,-240720226,-454922104,483042932]},{Slot:legs,AttributeName:"generic.armor",Name:generic.armor,Amount:5,Operation:0,UUID:[I;489119544,-265654359,666574937,-45893978]},{Slot:legs,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-446547269,260741696,881610904,-421210777]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 2
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
