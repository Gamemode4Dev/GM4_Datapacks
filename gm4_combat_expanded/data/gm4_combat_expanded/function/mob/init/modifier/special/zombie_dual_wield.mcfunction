# make this zombie a dual wielding zombie
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie

loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_weapon/generic
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.dual_wield_zombie 4 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.dual_wield_zombie -0.2 add_multiplied_base

scoreboard players set $modifier_picked gm4_ce_data 1
