# applies ender bolt symptoms to infected entities
# @s = entitiy infected with ender bolt
# at @s
# run from infection/active

# additional particles and damage
particle portal ~ ~ ~ .1 .5 .1 .8 10
effect give @s wither 2 0 true

# spread
function gm4_ender_bolt_shamir:infection/spread
