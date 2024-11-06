# give the zombie an offhand weapon and bonus stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/underground/pick

tag @s add gm4_mu_offhanding_zombie
item replace entity @s weapon.offhand with stone_sword
attribute @s attack_damage modifier add gm4_monsters_unbound:stat_change.offhand_weapon 1.5 add_value
