# Destroys marked trunk block one by one according to their depth score (in sequence).
# @s = none
# at world spawn
# scheduled from gm4_arborenda_shamir:player/chop and self via gm4_arborenda_shamir:trunk/check_depth if trunk markers remain

scoreboard players remove @e[type=marker,tag=gm4_arborenda_trunk] gm4_arb_depth 1
execute as @e[type=marker,tag=gm4_arborenda_trunk,scores={gm4_arb_depth=-2147483648..2147483647}] run function gm4_arborenda_shamir:trunk/check_depth
