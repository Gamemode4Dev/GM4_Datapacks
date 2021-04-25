# @s=golden_boots in cauldron
# at align xyz
# run from recipe/armor/boots/apply_modifier.mcfunction

data merge entity @s {PickupDelay:0,Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Slot:feet,AttributeName:"generic.knockback_resistance",Name:generic.knockback_resistance,Amount:0.25,Operation:0,UUID:[I;-244063540,-946724969,-502353081,-260690505]},{Slot:feet,AttributeName:"generic.armor",Name:generic.armor,Amount:2,Operation:0,UUID:[I;-126556938,70564786,-378124159,518794193]},{Slot:feet,AttributeName:"generic.armor_toughness",Name:generic.armor_toughness,Amount:3,Operation:0,UUID:[I;788661297,257142119,-985569927,-459662219]}]}}}
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set value 5
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["+25% Magic",{"translate":"item.gm4.zauber_armour.magic","with":["25"]}],"color":"blue","italic":"false"}'

kill @e[type=item,dx=0,dy=0,dz=0,nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}}]
scoreboard players set recipe_success gm4_zc_data 1
