# grant resistance to players being guarded by a guardian
# @s = player being guarded
# at world spawn
# run from armor/type/guardian/process

effect give @s resistance 1 1 true
tag @s add gm4_ce_guarded
scoreboard players set @s gm4_ce_guarded 0
