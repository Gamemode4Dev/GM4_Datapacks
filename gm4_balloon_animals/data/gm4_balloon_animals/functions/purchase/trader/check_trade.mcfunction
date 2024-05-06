# Checks the uses count for a specific gm4_balloon_animal trade
# @s = wandering trader, tag=gm4_balloon_animal_trader
# at player
# run from purchase/trades/parse_trades

execute store result score $uses gm4_balloon_animals_data run data get storage gm4_balloon_animals:temp temp_source[-1].uses

# if uses and maxUses matches, this is the trade we are looking for.
# continue with searching for purchased animal, reposition to trader for playsound
execute if score $uses gm4_balloon_animals_data matches 1 at @s as @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased,limit=1] run function gm4_balloon_animals:purchase/animal/search
# update the trade as processed
execute if score $uses gm4_balloon_animals_data matches 1 run function gm4_balloon_animals:purchase/trader/update_trade

# Typically balloon animal trades' uses will be 0 or 2.
# The maxUses is 1, but we can set any value including higher ones.

# If the uses is 0, we know that it has not been purchased,
# but if uses is 1, we can set the value higher after checking,
# which guarantees us that trades with a uses of 1 are the specific trade we are looking for
