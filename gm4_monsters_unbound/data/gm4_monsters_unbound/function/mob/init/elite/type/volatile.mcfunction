# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.volatile

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.volatile 2.5 add_multiplied_total

loot replace entity @s armor.head loot gm4_monsters_unbound:elite/volatile
data modify entity @s drop_chances.head set value 1

team join gm4_mu_elite.volatile

scoreboard players set @s gm4_sr_arrow.fire_delay 0
scoreboard players set @s gm4_sr_arrow.damage_change -10
