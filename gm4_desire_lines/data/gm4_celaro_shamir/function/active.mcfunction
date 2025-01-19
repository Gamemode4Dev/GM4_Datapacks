# Effects of the Celaro Shamir
# @s = player with Celaro on their armor
# at unspecified
# run from tick

# semi-ensure desire lines is disabled ($probability should only be modified NOT SET, as the modification order is load dependent)
scoreboard players remove $probability gm4_desire_lines 1000

# secondary celaro effect: invisibility inside foliage
execute if predicate gm4_celaro_shamir:stealth_active run effect give @s invisibility 1 0 true
