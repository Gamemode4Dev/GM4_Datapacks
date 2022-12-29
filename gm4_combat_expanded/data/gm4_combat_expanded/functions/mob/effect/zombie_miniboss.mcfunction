# set specific attributes for miniboss zombies
# @s = zombie miniboss
# at @s
# run from mob/mob_type/zombie

attribute @s zombie.spawn_reinforcements modifier add 0bec9c4f-5376-4171-823d-1aa08cbd3142 "gm4_ce_miniboss" 2 multiply
attribute @s generic.max_health modifier add 1ac3ea4d-e61d-4b1e-a575-fb10a478189d "gm4_ce_miniboss" 0.5 multiply
attribute @s generic.armor_toughness modifier add 6512eccc-ca44-4cf0-ad13-0fa881232494 "gm4_ce_miniboss" 0.5 multiply
attribute @s generic.armor modifier add 52d29350-f0c7-4be5-9bbc-59d1d409b254 "gm4_ce_miniboss" 0.5 multiply
attribute @s generic.attack_knockback modifier add 3e53c594-21c0-4ed3-9833-b135a4879a6c "gm4_ce_miniboss" 0.75 add
attribute @s generic.knockback_resistance modifier add d8b8f22e-bba8-47ca-b502-4cf83a847b4d "gm4_ce_miniboss" 0.85 add

loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/miniboss
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/miniboss
loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_shield/random

data modify entity @s ArmorDropChances set value [0.30F,0.30F,0.30F,0.30F]

data modify entity @s HandDropChances set value [0.50F,0.75F]
