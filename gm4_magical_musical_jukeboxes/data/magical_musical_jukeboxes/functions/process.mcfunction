# @s = magical musical jukebox armor stand positioned ~ ~1 ~
# run from main

data merge entity @s {Fire:2000}
tp @s ~ ~-1 ~ ~15 ~

execute unless entity @s[tag=gm4_mmj_has_disc] if data block ~ ~ ~ {RecordItem:{}} run function magical_musical_jukeboxes:check_disc
execute if entity @s[tag=gm4_mmj_has_disc] unless data block ~ ~ ~ {RecordItem:{}} run function magical_musical_jukeboxes:reset
execute unless block ~ ~ ~ jukebox run function magical_musical_jukeboxes:destroy
