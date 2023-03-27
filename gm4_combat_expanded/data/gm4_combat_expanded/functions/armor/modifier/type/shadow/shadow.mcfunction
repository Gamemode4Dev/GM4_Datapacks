# keep damage shield active while player has food
# @s = player being checked
# at world spawn
# run from armor/check_modifier/night

# resistance 3 if player has food haunches
effect give @s[scores={gm4_ce_hunger=1..}] resistance 2 2

# hunger 100 if player took damage, upped to 150 if at full hunger
effect give @s[scores={gm4_ce_hunger=..19,gm4_ce_hurt=1..},tag=!gm4_ce_immune_hunger] hunger 3 99 true
effect give @s[scores={gm4_ce_hunger=20..,gm4_ce_hurt=1..},tag=!gm4_ce_immune_hunger] hunger 3 149 true

# particles
particle dust 0.000 0.000 0.000 1 ~ ~1 ~ 0.25 0.5 0.25 1 15 normal
