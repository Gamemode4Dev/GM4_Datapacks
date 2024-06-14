# set specific attributes for miniboss zombies
# @s = zombie miniboss
# at @s
# run from mob/init/mob_type/zombie

summon husk ~0.1 ~0.15 ~0.02 {Tags:["gm4_ce_extra_mob"]}
summon husk ~-0.05 ~0.05 ~0.005 {Tags:["gm4_ce_extra_mob"]}
summon husk ~-0.15 ~0.1 ~-0.01 {Tags:["gm4_ce_extra_mob"]}
function gm4_combat_expanded:mob/init/modifier/special/burned_husk_army

attribute @s generic.max_health modifier add minecraft:1ac3ea4d-e61d-4b1e-a575-fb10a478189d 0.1 add_multiplied_base
attribute @s generic.armor_toughness modifier add minecraft:6512eccc-ca44-4cf0-ad13-0fa881232494 0.5 add_multiplied_base
attribute @s generic.armor modifier add minecraft:52d29350-f0c7-4be5-9bbc-59d1d409b254 0.5 add_multiplied_base
attribute @s generic.attack_knockback modifier add minecraft:3e53c594-21c0-4ed3-9833-b135a4879a6c 0.75 add_value
attribute @s generic.knockback_resistance modifier add minecraft:d8b8f22e-bba8-47ca-b502-4cf83a847b4d 0.75 add_value

scoreboard players set @s gm4_ce_damage_cap 75

loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/miniboss
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/miniboss
loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_weapon/shield

data modify entity @s ArmorDropChances set value [0.50F,0.50F,0.50F,0.50F]

data modify entity @s HandDropChances set value [0.50F,0.75F]

scoreboard players set $modifier_picked gm4_ce_data 1
