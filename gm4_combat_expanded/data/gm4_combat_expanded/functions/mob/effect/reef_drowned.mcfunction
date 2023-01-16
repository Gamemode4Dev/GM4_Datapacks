# apply reef effects to drowned
# @s = drowned
# at @s
# run from mob/mob_type/drowned

attribute @s generic.movement_speed modifier add 7641c49f-772a-410a-aa7a-f2375af40fce "gm4_ce_modifier_reef" 1 multiply
scoreboard players add $mob_armor gm4_ce_data 2
scoreboard players add $mob_toughness gm4_ce_data 6
execute if predicate gm4_combat_expanded:technical/chance/extra_drowned_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_drowned_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/reef_guardian_spawn if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon guardian ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

item replace entity @s[predicate=gm4_combat_expanded:technical/chance/reef_trident] weapon.mainhand with trident
