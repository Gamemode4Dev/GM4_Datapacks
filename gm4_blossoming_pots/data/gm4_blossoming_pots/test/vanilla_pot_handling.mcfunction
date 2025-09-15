# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

# place vanilla potted plant, there is no reason this should fail
setblock ~ ~1 ~2 flower_pot
give @s red_tulip 1
rotate @s facing ~.5 ~ ~2
dummy @s use block ~.5 ~1 ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_vanilla_flower_pot
assert not entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2]
assert not items entity @s weapon.mainhand red_tulip

await delay 2s

# replace vanilla potted plant with custom
give @s oak_leaves 1
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
