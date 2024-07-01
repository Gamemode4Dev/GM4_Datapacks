# set specific attributes for miniboss zombies
# @s = zombie miniboss
# at @s
# run from mob/init/mob_type/zombie

summon drowned ~0.1 ~0.15 ~0.02 {Tags:["gm4_ce_extra_mob"]}
summon drowned ~-0.05 ~0.05 ~0.005 {Tags:["gm4_ce_extra_mob"]}
summon drowned ~-0.15 ~0.1 ~-0.01 {Tags:["gm4_ce_extra_mob"]}
scoreboard players set $mob_extras gm4_ce_data 1

attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.miniboss 0.1 add_multiplied_base
attribute @s generic.armor_toughness modifier add gm4_combat_expanded:stat_change.miniboss 0.5 add_multiplied_base
attribute @s generic.armor modifier add gm4_combat_expanded:stat_change.miniboss 0.5 add_multiplied_base
attribute @s generic.attack_knockback modifier add gm4_combat_expanded:stat_change.miniboss 0.75 add_value
attribute @s generic.knockback_resistance modifier add gm4_combat_expanded:stat_change.miniboss 0.75 add_value

scoreboard players set @s gm4_ce_damage_cap 75

loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/miniboss
item replace entity @s weapon.mainhand with trident
loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_weapon/shield

data modify entity @s ArmorDropChances set value [0.50F,0.50F,0.50F,0.50F]

# slightly lower hand drop chance to keep tridents rare-ish
data modify entity @s HandDropChances set value [0.20F,0.75F]

scoreboard players set $modifier_picked gm4_ce_data 1
