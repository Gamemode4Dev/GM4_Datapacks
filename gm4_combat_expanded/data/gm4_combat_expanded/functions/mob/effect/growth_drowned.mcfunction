# apply growth effects to drowned
# @s = drowned
# at @s
# run from mob/mob_type/drowned

attribute @s generic.max_health modifier add f1f26b22-9f93-4fea-8416-96bae6867d80 "gm4_ce_modifier_growth" -0.25 multiply
attribute @s generic.attack_damage modifier add f1f26b22-9f93-4fea-8416-96bae6867d80 "gm4_ce_modifier_growth" -0.15 multiply
execute if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
