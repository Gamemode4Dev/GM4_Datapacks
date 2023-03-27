# apply growth effects to zombie
# @s = zombie
# at @s
# run from mob/mob_type/zombie

item replace entity @s weapon.mainhand with air
attribute @s generic.max_health modifier add f1f26b22-9f93-4fea-8416-96bae6867d80 "gm4_ce_modifier_growth" -0.25 multiply
attribute @s generic.attack_damage modifier add f1f26b22-9f93-4fea-8416-96bae6867d80 "gm4_ce_modifier_growth" -0.15 multiply
