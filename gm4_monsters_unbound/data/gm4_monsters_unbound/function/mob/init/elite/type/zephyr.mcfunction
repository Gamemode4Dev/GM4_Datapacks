# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.zephyr

effect give @s wind_charged infinite 0 true

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.speed 2.5 add_multiplied_total
attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:elite_buff.speed 0.15 add_multiplied_total
attribute @s minecraft:attack_knockback modifier add gm4_monsters_unbound:elite_buff.speed 0.5 add_value
attribute @s minecraft:fall_damage_multiplier modifier add gm4_monsters_unbound:elite_buff.speed -1 add_multiplied_total

item replace entity @s armor.head with white_wool[enchantments={binding_curse:1},enchantment_glint_override=false]
data modify entity @s drop_chances.head set value 0

team join gm4_mu_elite.zephyr

scoreboard players set @s gm4_sr_arrow.fire_delay 0
scoreboard players set @s gm4_sr_arrow.damage_change -15
