# @s = farm animal to be attached to trader, type=#gm4_balloon_animals:balloon_animal
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader
# run from wandering_trader/trade/pick_animal

tag @s add gm4_balloon_animal

effect give @s levitation infinite 0 true
effect give @s slow_falling infinite 0 true
effect give @s resistance infinite 4 true

data modify entity @s Age set value -2147483648
data modify entity @s leash.UUID set from storage gm4_balloon_animals:temp trader.uuid

execute store result score $variant_id gm4_balloon_animals_data run random value 0..2
execute if score $variant_id gm4_balloon_animals_data matches 0 run data modify entity @s variant set value "minecraft:warm"
execute if score $variant_id gm4_balloon_animals_data matches 1 run data modify entity @s variant set value "minecraft:temperate"
execute if score $variant_id gm4_balloon_animals_data matches 2 run data modify entity @s variant set value "minecraft:cold"

execute store result score @s gm4_balloon_animals_id run scoreboard players add $id gm4_balloon_animals_id 1
execute store result storage gm4_balloon_animals:temp gm4_balloon_animals.id int 1 run scoreboard players get $id gm4_balloon_animals_id

function gm4_balloon_animals:wandering_trader/trade/add_lead
