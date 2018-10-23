#run from seasons:general/clock_second


tag @s remove gm4_szn_check_biome

advancement revoke @s only seasons:check_biome/cold_ocean
advancement revoke @s only seasons:check_biome/deep_cold_ocean
advancement revoke @s only seasons:check_biome/deep_frozen_ocean
advancement revoke @s only seasons:check_biome/deep_lukewarm_ocean
advancement revoke @s only seasons:check_biome/deep_ocean
advancement revoke @s only seasons:check_biome/deep_warm_ocean
advancement revoke @s only seasons:check_biome/frozen_ocean
advancement revoke @s only seasons:check_biome/lukewarm_ocean
advancement revoke @s only seasons:check_biome/ocean
advancement revoke @s only seasons:check_biome/warm_ocean
advancement revoke @s only seasons:check_biome/the_nether
advancement revoke @s only seasons:check_biome/the_end

tag @s add gm4_szn_in_biome
scoreboard players set @s gm4_szn_timer 3