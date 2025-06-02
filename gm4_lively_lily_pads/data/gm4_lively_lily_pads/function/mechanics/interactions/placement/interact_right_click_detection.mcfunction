# place interaction logic
# @s = player who right clicked on interaction holding a supported item
# at @s
# run from advancement: gm4_lively_lily_pads:placement_rcd

advancement revoke @s only gm4_lively_lily_pads:placement_rcd
scoreboard players reset $minus_one gm4_llp.data

# item information
data modify storage gm4_llp:temp SelectedItem set from entity @s SelectedItem


# need to raycast for lily pad with a placement rcd on it

# then need to check to make sure it has no existing display on it

# use player SelectedItem to decide what display to summon
  # use SelectedItem string for macros for similar groups
  # use Predicates to decide what functions to run. Need to assign score here

# minus one on player mainhand if successful
execute if score $minus_one gm4_llp.data matches 1 run item modify entity @s weapon.mainhand gm4_lively_lily_pads:minus_one

# play sound at lily pad for @a[distance=..16]
