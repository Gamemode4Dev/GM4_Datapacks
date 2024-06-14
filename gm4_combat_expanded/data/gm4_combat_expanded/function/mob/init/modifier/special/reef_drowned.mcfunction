# apply reef effects to drowned
# @s = drowned
# at @s
# run from mob/init/mob_type/zombie

attribute @s generic.movement_speed modifier add 7641c49f-772a-410a-aa7a-f2375af40fce "gm4_ce_modifier_reef" 1 add_multiplied_base
attribute @s generic.armor modifier add 21a622ae-7a5f-4d4c-8f6f-6aff894cafe9 "gm4_ce_modifier_reef" 0.1 add_multiplied_base
attribute @s generic.armor_toughness modifier add 022348f2-efe3-4b83-9be5-6490cbb90381 "gm4_ce_modifier_reef" 0.75 add_multiplied_base
attribute @s generic.attack_damage modifier add f6ce0bb9-7203-4272-b8d8-9d3654a15ea0 "gm4_ce_modifier_reef" 2 add_value

execute if predicate gm4_combat_expanded:technical/chance/extra_drowned_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_drowned_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

item replace entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:technical/chance/reef_trident] weapon.mainhand with trident
