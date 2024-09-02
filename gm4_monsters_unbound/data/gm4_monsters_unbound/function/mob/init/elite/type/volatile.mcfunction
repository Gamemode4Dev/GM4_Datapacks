# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.volatile

attribute @s generic.max_health modifier add gm4_monsters_unbound:elite_buff.volatile 2.5 add_multiplied_total

item replace entity @s armor.head with purple_glazed_terracotta[enchantment_glint_override=false,minecraft:enchantments={"blast_protection":10}]
loot replace entity @s armor.head loot gm4_monsters_unbound:elite/volatile
data modify entity @s ArmorDropChances[3] set value 1F

team join gm4_mu_elite.volatile

scoreboard players set @s gm4_sr_proj_fire_delay 0
scoreboard players set @s gm4_sr_proj_damage_change -10
