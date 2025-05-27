# @s = animal to be attached to trader, type=#gm4_balloon_animals:balloon_animal
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader,tag=gm4_balloon_animal_trader_new
# run from wandering_trader/trade/pick_animal

tag @s add gm4_balloon_animal

effect give @s levitation infinite 0 true
effect give @s slow_falling infinite 0 true
effect give @s resistance infinite 4 true

data modify entity @s Age set value -2147483648
data modify entity @s leash.UUID set from storage gm4_balloon_animals:temp trader.uuid

scoreboard players add $id gm4_balloon_animals_id 1
scoreboard players operation @s gm4_balloon_animals_id = $id gm4_balloon_animals_id
execute store result storage gm4_balloon_animals:temp gm4_balloon_animals.id int 1 run scoreboard players get $id gm4_balloon_animals_id

execute summon trader_llama run function gm4_balloon_animals:wandering_trader/trade/spawn_trade_llama

data modify entity @s CustomName set from storage gm4_balloon_animals:temp CustomName
