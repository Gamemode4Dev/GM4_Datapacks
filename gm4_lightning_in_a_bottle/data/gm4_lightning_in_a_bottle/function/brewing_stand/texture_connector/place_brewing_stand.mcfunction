# forces nearby texture_connectors to update
# @s = player who has placed a lightning rod on a brewing stand
# at @s
# run from advancement place_lightning_rod

say place

# revoke advancement
advancement revoke @s only gm4_lightning_in_a_bottle:place_lightning_rod

# find placed brewing stand and summon texture connector
scoreboard players set $ray gm4_liab_data 500
execute anchored eyes positioned ^ ^ ^ run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/ray
