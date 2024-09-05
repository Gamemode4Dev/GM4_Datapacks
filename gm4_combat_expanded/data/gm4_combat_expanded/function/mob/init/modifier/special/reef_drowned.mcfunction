# apply reef effects to drowned
# @s = drowned
# at @s
# run from mob/init/mob_type/zombie

attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.reef 1 add_multiplied_base
attribute @s generic.armor modifier add gm4_combat_expanded:stat_change.reef 0.1 add_multiplied_base
attribute @s generic.armor_toughness modifier add gm4_combat_expanded:stat_change.reef 0.75 add_multiplied_base
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.reef 2 add_value

execute if predicate gm4_combat_expanded:technical/chance/extra_drowned_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_drowned_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

item replace entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:technical/chance/reef_trident] weapon.mainhand with trident
