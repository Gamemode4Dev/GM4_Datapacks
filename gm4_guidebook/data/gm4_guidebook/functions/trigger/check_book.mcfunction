# checks if the player was holding a guidebook when triggering the scoreboard
# @s = player that triggered gm4_guide
# located at world spawn
# run from tick

# if the player is holding the guidebook, check what trigger is set
execute if predicate gm4_guidebook:book_in_mainhand run function gm4_guidebook:trigger/mainhand
execute if predicate gm4_guidebook:book_in_offhand run function gm4_guidebook:trigger/offhand

# reset the trigger
scoreboard players reset @s gm4_guide
scoreboard players enable @s gm4_guide
