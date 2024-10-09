# apply reef effects to drowned
# @s = drowned
# at @s
# run from mob/init/mob_type/zombie/base

attribute @s generic.movement_speed modifier add gm4_monsters_unbound:stat_change.reef 1 add_multiplied_base
attribute @s generic.attack_damage modifier add gm4_monsters_unbound:stat_change.reef 2 add_value

execute if predicate {condition:"minecraft:random_chance",chance:0.6} if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon drowned ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.6} if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon drowned ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.45} if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon guardian ~ ~ ~
execute if predicate {condition:"minecraft:random_chance",chance:0.45} if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon guardian ~ ~ ~
execute if predicate {condition:"minecraft:random_chance",chance:0.45} if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon guardian ~ ~ ~

execute if predicate {condition:"minecraft:random_chance",chance:0.33} run item replace entity @s[tag=!gm4_sr_extra_mob] weapon.mainhand with trident

scoreboard players set @s gm4_sr_arrow.fire_delay 0
