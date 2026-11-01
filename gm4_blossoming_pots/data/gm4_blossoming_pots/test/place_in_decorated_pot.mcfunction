# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

# place
setblock ~ ~1 ~2 decorated_pot
give @s oak_leaves
rotate @s facing ~.5 ~ ~2
dummy @s use block ~.5 ~1 ~2
await entity @e[type=block_display,tag=gm4_blossoming_pots.display.decorated_pot,dx=2,dy=2,dz=2]

await delay 2s

# break
dummy @s mine ~.5 ~1 ~2
await not entity @e[type=block_display,tag=gm4_blossoming_pots.display.decorated_pot,dx=2,dy=2,dz=2]
