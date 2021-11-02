# @s = fang_thrower armor stand
# run from tick

tp @s ^ ^ ^1
execute at @s run function gm4_orb_of_ankou:pneumas/conjuring/summon_fangs
scoreboard players remove @s gm4_pneuma_data 1
kill @s[scores={gm4_pneuma_data=..0}]
