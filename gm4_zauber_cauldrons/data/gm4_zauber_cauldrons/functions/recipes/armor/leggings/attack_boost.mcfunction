# @s=golden_leggings in cauldron
# at align xyz
# run from recipe/armor/leggings/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:legs,AttributeName:"generic.attack_damage",Name:generic.attack_damage,Amount:0.35,Operation:2,UUID:[I;98171848,952916658,399512331,-132029736]},{Slot:legs,AttributeName:"generic.armor",Name:generic.armor,Amount:5,Operation:0,UUID:[I;82057528,-946070226,-866864687,-661686259]},{Slot:legs,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;-662641133,529863347,171046543,-775356714]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 3
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
