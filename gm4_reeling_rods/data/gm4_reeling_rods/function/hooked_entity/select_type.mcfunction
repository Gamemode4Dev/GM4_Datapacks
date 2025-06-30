# Selects the right entity type or dismounts the entity.
# @s = hooked entity
# at bobber in entity
# run from player/find_hooked_entity

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
