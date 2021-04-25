# @s=golden_chestplate in cauldron
# at align xyz
# run from recipe/armor/chestplate/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:chest,AttributeName:"generic.attack_damage",Name:generic.attack_damage,Amount:0.35,Operation:2,UUID:[I;727806222,89105198,496832575,-80857905]},{Slot:chest,AttributeName:"generic.armor",Name:generic.armor,Amount:7,Operation:0,UUID:[I;-282257929,957982993,-774420762,275642819]},{Slot:chest,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;846339277,258910980,-725985973,273883983]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 3
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
