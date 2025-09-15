# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

# place
setblock ~ ~1 ~2 flower_pot
item replace entity @s weapon.mainhand with oak_leaves
rotate @s facing ~.5 ~ ~2
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_flower_pot
await entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
assert not items entity @s weapon.mainhand *

await delay 2s

# remove
#assert not items entity @s weapon.mainhand *     <---- FAILING???
function gm4_blossoming_pots:say_item with entity @s SelectedItem
clear @s *
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_flower_pot
await not entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
await items entity @s weapon.mainhand oak_leaves

await delay 2s

# place back, to break
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_flower_pot
await delay 1s
dummy @s mine ~.5 ~1 ~2
await not entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
assert entity @e[type=item,nbt={Item:{id:"minecraft:oak_leaves",count:1}},dx=2,dy=2,dz=2]
