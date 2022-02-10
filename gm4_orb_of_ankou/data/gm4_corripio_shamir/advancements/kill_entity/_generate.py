values = ['axolotl','bat','bee','blaze', 'cat','cave_spider','chicken','cod','cow','creeper','dolphin','donkey','drowned','elder_guardian','ender_dragon','enderman','endermite','evoker','fox','ghast','giant','glow_squid','goat','guardian','hoglin','horse','husk','illusioner','iron_golem','llama','magma_cube','mooshroom','mule','ocelot','panda','parrot','phantom','pig','piglin','piglin_brute','pillager','polar_bear','pufferfish','rabbit','ravager','salmon','sheep','shulker','silverfish','skeleton_horse','skeleton','slime','snow_golem','spider','squid','stray','strider','trader_llama','tropical_fish','turtle','vex','villager','vindicator','wandering_trader','witch','wither_skeleton','wither','wolf','zoglin','zombie_horse','zombie_villager','zombie','zombified_piglin']
# for each item in the list of items
for value in values:
# construct the filename; prefix or suffix optional
    filename = value + '.json'
# open the file to be written
    fo = open(filename, 'w')
# write the content in the file including the value being passed to each; %s indicates a string
    fo.write('{\n  "criteria": {\n    "requirement": {\n      "trigger": "minecraft:player_killed_entity",\n      "conditions": {\n        "entity": [\n          {\n            "condition": "minecraft:entity_properties",\n            "entity": "this",\n            "predicate": {\n              "type": "minecraft:' + '%s' %value + '"\n            }\n          },\n          {\n            "condition": "minecraft:inverted",\n            "term": {\n              "condition": "minecraft:entity_properties",\n              "entity": "this",\n              "predicate": {\n                "nbt": "{Tags:[\\\"gm4_oa_ignore\\\"]}"\n              }\n            }\n          }\n        ],\n        "killing_blow": {\n          "source_entity": {\n            "equipment": {\n              "mainhand": {\n                "nbt": "{gm4_metallurgy:{has_shamir:1b,active_shamir:\'corripio\'}}"\n              }\n            }\n          }\n        }\n      }\n    }\n  },\n  "rewards": {\n    "function": "gm4_corripio_shamir:kill_entity/' + '%s' %value + '"\n  }\n}\n')
#close the file
fo.close()
