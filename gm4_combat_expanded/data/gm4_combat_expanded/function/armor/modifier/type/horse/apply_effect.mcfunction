# give mount speed
# @s = vehicle that had speed stored
# at unspecified
# run from clocks/player_submain

# give effect
effect give @s[scores={gm4_ce_horse.speed_level=1}] speed 3 0 true
effect give @s[scores={gm4_ce_horse.speed_level=2..3}] speed 3 1 true
effect give @s[scores={gm4_ce_horse.speed_level=4..7}] speed 3 2 true
effect give @s[scores={gm4_ce_horse.speed_level=8..15}] speed 3 3 true
effect give @s[scores={gm4_ce_horse.speed_level=16..31}] speed 3 4 true
# in case of additional player a higher level can be reached
effect give @s[scores={gm4_ce_horse.speed_level=32..}] speed 3 5 true


scoreboard players reset @s gm4_ce_horse.speed_level
