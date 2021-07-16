# @s = player with bounding pneuma who stopped sneaking
# run from pneumas/sneak/stopped

effect give @s[scores={gm4_oa_snk_num=40..79}] jump_boost 30 3 true
effect give @s[scores={gm4_oa_snk_num=80..159}] jump_boost 30 5 true
effect give @s[scores={gm4_oa_snk_num=160..319}] jump_boost 30 7 true
effect give @s[scores={gm4_oa_snk_num=320..}] jump_boost 30 9 true
