# Add death tracking and reset objective in case the player died while the data pack was disabled
scoreboard objectives add gm4_player_death_count deathCount
scoreboard players reset * gm4_player_death_count
