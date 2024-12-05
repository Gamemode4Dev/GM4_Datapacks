# give the zombie a shield and bonus stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/underground/pick
# run from mob/init/mob_type/zombie/mountainous
# run from mob/init/mob_type/zombie/snowy

tag @s add gm4_mu_shielded_zombie
item replace entity @s weapon.offhand with shield
attribute @s knockback_resistance modifier add gm4_monsters_unbound:stat_change.shield 0.9 add_value
attribute @s armor modifier add gm4_monsters_unbound:stat_change.shield 20 add_value
attribute @s armor_toughness modifier add gm4_monsters_unbound:stat_change.shield 10 add_value
