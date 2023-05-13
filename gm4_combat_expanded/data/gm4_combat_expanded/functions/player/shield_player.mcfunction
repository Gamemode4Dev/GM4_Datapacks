# give player absorption effect based on their score in gm4_ce_absorp
# @s = player to grant shield
# at world spawn
# run from armor/modifier/type/reactive/add_level
# run from player/process

# remove one to match absorption level
scoreboard players remove @s gm4_ce_absorp 1

# clear absorption to stop bug (MC-182497)
effect clear @s absorption

# apply absorption
execute if score @s gm4_ce_absorp matches 0 run effect give @s absorption 30 0 true
execute if score @s gm4_ce_absorp matches 1 run effect give @s absorption 30 1 true
execute if score @s gm4_ce_absorp matches 2 run effect give @s absorption 30 2 true
execute if score @s gm4_ce_absorp matches 3 run effect give @s absorption 30 3 true
execute if score @s gm4_ce_absorp matches 4 run effect give @s absorption 30 4 true
execute if score @s gm4_ce_absorp matches 5 run effect give @s absorption 30 5 true
execute if score @s gm4_ce_absorp matches 6 run effect give @s absorption 30 6 true
execute if score @s gm4_ce_absorp matches 7 run effect give @s absorption 30 7 true
execute if score @s gm4_ce_absorp matches 8 run effect give @s absorption 30 8 true
execute if score @s gm4_ce_absorp matches 9 run effect give @s absorption 30 9 true
execute if score @s gm4_ce_absorp matches 10 run effect give @s absorption 30 10 true
execute if score @s gm4_ce_absorp matches 11 run effect give @s absorption 30 11 true

# cleanup
scoreboard players reset @s gm4_ce_absorp
