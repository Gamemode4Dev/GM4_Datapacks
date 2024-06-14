# apply growth effects to skeleton
# @s = skeleton
# at @s
# run from mob/init/mob_type/skeleton

item replace entity @s weapon.mainhand with air
attribute @s generic.max_health modifier add minecraft:f1f26b22-9f93-4fea-8416-96bae6867d80 -0.25 add_multiplied_base
attribute @s generic.movement_speed modifier add minecraft:0f98404f-d7ab-40bf-92a3-4944640b5b0e 0.24 add_multiplied_base
