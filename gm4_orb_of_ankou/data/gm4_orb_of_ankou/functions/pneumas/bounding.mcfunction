# @s = player with bounding pneuma who stopped sneaking
# run from pneumas/sneak/stopped

effect give @s[scores={gm4_oa_snk_num=10..19}] jump_boost 30 3 true
effect give @s[scores={gm4_oa_snk_num=20..39}] jump_boost 30 5 true
effect give @s[scores={gm4_oa_snk_num=40..59}] jump_boost 30 7 true
effect give @s[scores={gm4_oa_snk_num=60..}] jump_boost 30 9 true
