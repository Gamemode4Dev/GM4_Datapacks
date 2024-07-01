# make this zombie a shielded zombie
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie

item replace entity @s weapon.offhand with shield
attribute @s generic.armor modifier add gm4_combat_expanded:stat_change.shielded_zombie 5 add_value
attribute @s generic.armor modifier add gm4_combat_expanded:stat_change.shielded_zombie 0.5 add_multiplied_base
attribute @s generic.armor_toughness modifier add gm4_combat_expanded:stat_change.shielded_zombie 20 add_value
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.shielded_zombie -2 add_value
scoreboard players set $mob_health gm4_ce_data 0

scoreboard players set $modifier_picked gm4_ce_data 1
