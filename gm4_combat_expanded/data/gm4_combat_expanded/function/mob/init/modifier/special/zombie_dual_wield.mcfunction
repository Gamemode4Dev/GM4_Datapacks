# make this zombie a dual wielding zombie
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie

loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_weapon/generic
attribute @s generic.attack_damage modifier add minecraft:1fedc32d-43a2-4f9d-868b-77bf09ff6d14 4 add_value
attribute @s generic.movement_speed modifier add minecraft:4d882f6c-b26f-4a5b-bffd-5cdba0784351 -0.2 add_multiplied_base

scoreboard players set $modifier_picked gm4_ce_data 1
