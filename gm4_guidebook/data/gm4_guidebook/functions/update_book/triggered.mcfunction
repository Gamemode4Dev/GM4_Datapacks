# checks if the player was holding a guidebook when triggering the scoreboard
# @s = player that triggered gm4_guide
# located at world spawn
# run from gm4_guidebook:tick

# if the player is holding the guidebook, update it
execute if predicate gm4_guidebook:holding_book run function gm4_guidebook:update_book/get_pages

# reset the trigger
scoreboard players reset @s gm4_guide
scoreboard players enable @s gm4_guide
