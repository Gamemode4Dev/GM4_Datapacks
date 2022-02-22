# run from armor/active/guardian/process
# @s = player being guarded

effect give @s resistance 1 2 true
tag @s add gm4_ai_guarded
scoreboard players set @s gm4_ai_guarded 0
