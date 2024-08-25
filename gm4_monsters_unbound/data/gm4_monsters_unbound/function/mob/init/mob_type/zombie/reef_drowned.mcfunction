# apply reef effects to drowned
# @s = drowned
# at @s
# run from mob/init/mob_type/zombie/base

attribute @s generic.movement_speed modifier add gm4_monsters_unbound:stat_change.reef 1 add_multiplied_base
attribute @s generic.attack_damage modifier add gm4_monsters_unbound:stat_change.reef 2 add_value

execute if predicate gm4_monsters_unbound:chance/zombie/extra_drowned_spawn if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon drowned ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if predicate gm4_monsters_unbound:chance/zombie/extra_drowned_spawn if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon drowned ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if predicate gm4_monsters_unbound:chance/zombie/reef_guardian_spawn if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon guardian ~ ~ ~
execute if predicate gm4_monsters_unbound:chance/zombie/reef_guardian_spawn if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon guardian ~ ~ ~
execute if predicate gm4_monsters_unbound:chance/zombie/reef_guardian_spawn if entity @s[tag=!gm4_sr_extra_mob] store success score $mob_extras gm4_sr_data run summon guardian ~ ~ ~

item replace entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:chance/zombie/reef_trident] weapon.mainhand with trident
