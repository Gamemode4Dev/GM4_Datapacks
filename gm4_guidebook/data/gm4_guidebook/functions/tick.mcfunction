schedule function gm4_guidebook:tick 1t

# if a player is holding the guidebook, turn off sendCommandFeedback
execute if score $sendCommandFeedback gm4_guide_config matches 1 run gamerule sendCommandFeedback true
execute if score $forceCommandFeedback gm4_guide_config matches 0 if entity @a[predicate=gm4_guidebook:holding_book,limit=1] run gamerule sendCommandFeedback false

# jump to prev section
execute as @a[scores={gm4_guide_prev=1..}] run function gm4_guidebook:hand/prev_section/search

# jump to next section
execute as @a[scores={gm4_guide_next=1..}] run function gm4_guidebook:hand/next_section/search

# jump to section
execute as @a[scores={gm4_guide=1..},predicate=gm4_guidebook:holding_book] run function gm4_guidebook:hand/update

# reset triggers
scoreboard players reset @a gm4_guide_prev
scoreboard players reset @a gm4_guide_next
scoreboard players reset @a gm4_guide
scoreboard players enable @a gm4_guide_prev
scoreboard players enable @a gm4_guide_next
scoreboard players enable @a gm4_guide
