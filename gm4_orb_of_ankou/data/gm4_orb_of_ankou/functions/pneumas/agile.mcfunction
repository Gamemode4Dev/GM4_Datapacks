# @s = player with agile pneuma who is in the air
# run from pneumas/temp_tick/agile

execute store result score @s gm4_pneuma_data run data get entity @s FallDistance
effect give @s[scores={gm4_pneuma_data=1..}] jump_boost 1 255 true
