# summons wandering trader with 2 llamas, as if it were a natural trader
# run manually

execute summon wandering_trader run function gm4_balloon_animals:debug/init_trader
execute summon trader_llama run data modify entity @s leash.UUID set from storage gm4_balloon_animals:temp trader.uuid
execute summon trader_llama run data modify entity @s leash.UUID set from storage gm4_balloon_animals:temp trader.uuid
