# Set up balloon animal and trade for the balloon animal trader
# @s = animal, balloon animal to be attached to trader
# at @s
# run from gm4_balloon_animal:wandering_trader/animal_two/choose_common or /choose_rare

tag @s add gm4_balloon_animal

effect give @s levitation infinite 0 true
effect give @s slow_falling infinite 0 true
effect give @s resistance infinite 4 true

data modify entity @s Age set value -2147483648
data modify entity @s Leash.UUID set from storage gm4_balloon_animals:temp trader.uuid

scoreboard players add $id gm4_balloon_animals_id 1
scoreboard players operation @s gm4_balloon_animals_id = $id gm4_balloon_animals_id
execute store result storage gm4_balloon_animals:temp gm4_balloon_animals.id int 1 run scoreboard players get $id gm4_balloon_animals_id

summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{id:"minecraft:emerald",Count:12b,Slot:3b},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:1,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_balloon_animals:trade_2/lead
item modify entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 gm4_balloon_animals:set_lead_data

data modify storage gm4_balloon_animals:temp name_json set from entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] Items[0].tag.display.Lore[0]
data modify storage gm4_balloon_animals:temp name_spliced set string storage gm4_balloon_animals:temp name_json 9 -17
data modify entity @s CustomName set from storage gm4_balloon_animals:temp name_spliced

tag @e[type=trader_llama] remove gm4_new_trade_option
