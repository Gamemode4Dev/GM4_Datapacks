# @s = any survival player
# at unspecified
# run from #gm4_desire_lines:expansion

# semi-ensure desire lines is disabled ($probability should only be modified NOT SET, as the modification order is load dependent)
execute if predicate gm4_boots_of_ostara:boots_equipped run scoreboard players remove $probability gm4_desire_lines 1000
