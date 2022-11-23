# add difficulty from challenge armor
# @s = player not in spectator
# at world spawn
# run from player/calculate_difficulty

# grant advancement
advancement grant @s only gm4:combat_expanded_challenger

# set difficulty to 10, then add 1 for each piece
scoreboard players set @s gm4_ce_difficult 10
execute if predicate gm4_combat_expanded:modified_armor/challenge/head run scoreboard players add @s gm4_ce_difficult 1
execute if predicate gm4_combat_expanded:modified_armor/challenge/chest run scoreboard players add @s gm4_ce_difficult 1
execute if predicate gm4_combat_expanded:modified_armor/challenge/legs run scoreboard players add @s gm4_ce_difficult 1
execute if predicate gm4_combat_expanded:modified_armor/challenge/feet run scoreboard players add @s gm4_ce_difficult 1
