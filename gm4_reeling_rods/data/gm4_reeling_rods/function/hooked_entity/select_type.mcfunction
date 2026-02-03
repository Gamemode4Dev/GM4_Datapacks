# Dispatch function for logic on hooked entity
# @s = hooked entity
# at bobber in entity
# run from #gm4_hooked_entity:on_hooked_entity

# fails
execute if score $adventure gm4_reeling_rods.math matches 1 run return fail
execute if entity @s[type=#gm4_reeling_rods:ignore] run return fail
execute if entity @s[tag=smithed.entity] run return fail
execute if data entity @s {Invulnerable:1b} run return fail

# apply barbed damage
execute if data storage gm4_reeling_rods:temp enchanted.barbed if data entity @s Health unless entity @s[type=player,gamemode=creative] \
  run function gm4_reeling_rods:barbed/apply with storage gm4_reeling_rods:temp enchanted.barbed
execute if data storage gm4_reeling_rods:temp enchanted.barbed if entity @s[type=minecraft:tnt_minecart] \
  run return run data modify entity @s fuse set value 0s

raw # non-dismountable entities
for entity in ctx.meta['non_dismountable_entities']:
    if entity['needs_reeling'].as_bool():
        execute if entity @s[type=entity['id']] run return run execute if data storage gm4_reeling_rods:temp enchanted.reeling run function entity['function']
    else:
        execute if entity @s[type=entity['id']] run return run function entity['function']

raw # dismounting logic
execute if function gm4_reeling_rods:hooked_entity/is_passenger run return run ride @s dismount

raw # dismountable entities
for entity in ctx.meta['dismountable_entities']:
    if entity['needs_reeling'].as_bool():
        execute if entity @s[type=entity['id']] run return run execute if data storage gm4_reeling_rods:temp enchanted.reeling run function entity['function']
    else:
        execute if entity @s[type=entity['id']] run return run function entity['function']
