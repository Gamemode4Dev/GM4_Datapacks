# set specific attributes for miniboss zombies
# @s = zombie miniboss
# at @s
# run from mob/mob_type/zombie

attribute @s zombie.spawn_reinforcements modifier add 0bec9c4f-5376-4171-823d-1aa08cbd3142 "gm4_ce_miniboss" 2 multiply
attribute @s generic.max_health modifier add 1ac3ea4d-e61d-4b1e-a575-fb10a478189d "gm4_ce_miniboss" 0.5 multiply

loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/miniboss
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/miniboss
item replace entity @s weapon.offhand with shield{BlockEntityTag:{Base:13}}
