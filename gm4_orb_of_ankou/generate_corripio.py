from beet import Context, Advancement, Function

ENTITIES = ['allay','axolotl','bat','bee','blaze','cat','cave_spider','chicken','cod','cow','creeper','dolphin','donkey','drowned','elder_guardian','ender_dragon','enderman','endermite','evoker','fox','frog','ghast','giant','glow_squid','goat','guardian','hoglin','horse','husk','illusioner','iron_golem','llama','magma_cube','mooshroom','mule','ocelot','panda','parrot','phantom','pig','piglin','piglin_brute','pillager','polar_bear','pufferfish','rabbit','ravager','salmon','sheep','shulker','silverfish','skeleton_horse','skeleton','slime','snow_golem','spider','squid','stray','strider','tadpole','trader_llama','tropical_fish','turtle','vex','villager','vindicator','wandering_trader','warden','witch','wither_skeleton','wither','wolf','zoglin','zombie_horse','zombie_villager','zombie','zombified_piglin']

def beet_default(ctx: Context):
  """Creates advancements and functions for each mob that the corripio shamir works on."""
  for entity in ENTITIES:
    # Advancement to detect when a player kills the mob using a corripio shamir
    ctx.data[f"gm4_corripio_shamir:kill_entity/{entity}"] = Advancement({
      "criteria": {
        "requirement": {
          "trigger": "minecraft:player_killed_entity",
          "conditions": {
            "entity": [
              {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": { "type": f"minecraft:{entity}" }
              },
              *[{
                "condition": "minecraft:inverted",
                "term": {
                  "condition": "minecraft:entity_properties",
                  "entity": "this",
                  "predicate": {
                    "nbt": "{Tags:[\"" + tag + "\"]}"
                  }
                }
              } for tag in ["gm4_oa_ignore", "smithed.entity"]],
            ],
            "killing_blow": { "source_entity": { "equipment": { "mainhand": {
              "nbt": "{gm4_metallurgy:{has_shamir:1b,active_shamir:'corripio'}}"
            } } } }
          }
        }
      },
      "rewards": { "function": f"gm4_corripio_shamir:kill_entity/{entity}" }
    })

    # Function to summon the items and revoke the advancement
    ctx.data[f"gm4_corripio_shamir:kill_entity/{entity}"] = Function([
      f"# run from advancement kill_entity/{entity}",
      f"# @s = player who killed a {entity} using the corripio shamir",
      "",
      f"loot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/{entity} ~ ~ ~ mainhand",
      "execute as @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:\"soul_essence\"}}}}] run data merge entity @s {PickupDelay:0}",
      "",
      f"advancement revoke @s only gm4_corripio_shamir:kill_entity/{entity}",
    ])
