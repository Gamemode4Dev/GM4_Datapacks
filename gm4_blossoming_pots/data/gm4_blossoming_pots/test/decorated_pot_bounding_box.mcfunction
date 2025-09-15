# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

# tests for correct pot found when raycast overlaps with a different decorated pot
setblock ~1 ~1 ~2 decorated_pot{item:{id:"minecraft:cherry_sapling",count:1}}
setblock ~1 ~1 ~1 decorated_pot{item:{id:"minecraft:cherry_leaves",count:1}}
rotate @s facing ~1.06 ~ ~2
#advancement grant @s only gm4_blossoming_pots:interact_with_decorated_pot
await entity @e[type=block_display,tag=gm4_blossoming_pots.display.decorated_pot,nbt={block_state:{Name:"minecraft:cherry_sapling"}},dx=2,dy=2,dz=2]
