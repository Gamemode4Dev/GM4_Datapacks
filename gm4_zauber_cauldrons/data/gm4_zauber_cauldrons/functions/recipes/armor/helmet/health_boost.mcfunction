# @s=golden_helmet in cauldron
# at align xyz
# run from recipe/armor/helmet/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:head,AttributeName:"generic.max_health",Name:generic.max_health,Amount:6,Operation:0,UUID:[I;-603219768,-158339518,-706395048,79604255]},{Slot:head,AttributeName:"generic.armor",Name:generic.armor,Amount:3,Operation:0,UUID:[I;-441595955,-453535841,-360996355,-301957561]},{Slot:head,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-57449288,-979610965,923369686,-139337251]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 2
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
