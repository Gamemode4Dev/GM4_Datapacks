# make this zombie a shielded zombie
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie

item replace entity @s weapon.offhand with shield
attribute @s generic.armor modifier add 10da66ed-0b0c-4249-8495-1a846574a035 "gm4_ce_shielded_zombie" 5 add_value
attribute @s generic.armor modifier add c044809d-cd74-4539-8606-eaaf173a915e "gm4_ce_shielded_zombie" 0.5 add_multiplied_base
attribute @s generic.armor_toughness modifier add d665d62f-5e76-4168-9436-cd2e29310b1c "gm4_ce_shielded_zombie" 20 add_value
attribute @s generic.max_health modifier add 1187c742-cf92-4b0c-80de-591997cd4468 "gm4_ce_shielded_zombie" -2 add_value
scoreboard players set $mob_health gm4_ce_data 0

scoreboard players set $modifier_picked gm4_ce_data 1
