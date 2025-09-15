# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

# place vanilla potted plant, there is no reason this should fail
setblock ~ ~1 ~2 flower_pot
item replace entity @s weapon.mainhand with red_tulip
rotate @s facing ~.5 ~ ~2 
# <-- you're next, mr rotate command
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_vanilla_flower_pot
assert not entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
assert not items entity @s weapon.mainhand *

await delay 2s

# replace vanilla potted plant with custom
item replace entity @s weapon.mainhand with oak_leaves
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_flower_pot
assert entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
assert not items entity @s weapon.mainhand oak_leaves

await delay 2s

# place vanilla plant in custom pot, should fail
item replace entity @s weapon.mainhand with orange_tulip
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_vanilla_flower_pot
assert entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
await items entity @s weapon.mainhand orange_tulip
