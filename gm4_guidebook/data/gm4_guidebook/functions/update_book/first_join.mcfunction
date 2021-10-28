# gives all players the guidebook upon joining for the first time
# @s = new player
# located at @s
# run from advancement gm4_guidebook:first_join

# if the scoreboard is set to 1, give the player a book
execute if score $giveNewPlayers gm4_guide_config matches 1 run loot give @s loot gm4_guidebook:items/guidebook
