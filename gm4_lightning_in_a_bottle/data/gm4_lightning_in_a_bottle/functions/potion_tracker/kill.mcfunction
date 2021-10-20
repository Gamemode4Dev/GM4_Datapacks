# force-kills tracker markers in case they are in lazy loaded chunks
# @s = gm4_liab_potion_tracker markers
# at world spawn
# run from main

scoreboard players add @s gm4_liab_data 1
kill @s[scores={gm4_liab_data=4..}]
