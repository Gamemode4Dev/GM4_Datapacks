from beet import Context, Advancement, Function, LootTable, Predicate
import csv
from typing import Any

SUPPORTED_LOOTING = 10

entities = {}
pneumas:list[str] = []
updated_csv = [['-Run beet to update columns 4-9'],[],['.Mob','.Soul Essence','Base','L I','L II','L III','.','K/E (L III)','K/S (L III)']]

def beet_default(ctx: Context):
  """Creates advancements, functions, and loot tables for each mob that the corripio shamir works on."""
  read_csv()
  generate_corripio(ctx)
  generate_pneuma_predicates(ctx)
  generate_soul_essence_loot_tables(ctx)
  

def generate_corripio(ctx: Context):
  entity: Any
  for entity in entities:
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
              "predicates": {
                "minecraft:custom_data": "{gm4_metallurgy:{has_shamir:1b,active_shamir:'corripio'}}"
              }
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

    # Loot table to drop the items
    pools: Any = []
    essence: Any = ''
    for essence in entities[entity]:
      pool: Any = {
        "rolls": 1,
        "entries": [{
          "type": "minecraft:loot_table",
          "value": f"gm4_orb_of_ankou:items/soul_essence/{essence}"
        }]
      }
      pool["conditions"] = [{
        "condition": "minecraft:table_bonus",
        "enchantment": "minecraft:looting",
        "chances": []
      }]
      base_chance: Any = entities[entity][essence]
      for i in range(SUPPORTED_LOOTING+1):
        pool["conditions"][0]["chances"].append(looting_chance(base_chance,i))
      pools.append(pool)

    ctx.data[f"gm4_corripio_shamir:entities/{entity}"] = LootTable({
      "type": "minecraft:fishing",
      "pools": pools
    })



def generate_pneuma_predicates(ctx: Context):
  pneuma: Any = ""
  for pneuma in pneumas:
    # Predicate to check if a player has a certain pneuma equipped
    custom_data = "{gm4_orb_of_ankou:{pneumas:[{id:'"+ pneuma + "'}]}}"
    ctx.data[f"gm4_orb_of_ankou:pneuma_equipped/{pneuma}"] = Predicate({
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "equipment": {
          "offhand": {
            "items": "#gm4_orb_of_ankou:pneuma_container",
            "predicates": {
              "minecraft:custom_data": custom_data
            }
          }
        }
      }
    })


def looting_chance(base: float,lvl: int) -> float:
  return min(1.0,round(base * (1 + (3 * (lvl**3))),6))


def generate_soul_essence_loot_tables(ctx: Context):
  for pneuma in pneumas:
    custom_data = "{gm4_orb_of_ankou:{item:'soul_essence',stored_pneuma:{id:'" + pneuma + "'}},smithed:{ignore:{functionality:1b,crafting:1b}}}"
    ctx.data[f"gm4_orb_of_ankou:items/soul_essence/{pneuma}"] = LootTable({
      "type": "minecraft:generic",
      "pools": [
        {
          "rolls": 1,
          "entries": [
            {
              "type": "minecraft:item",
              "name": "minecraft:black_dye",
              "functions": [
                {
                  "function": "minecraft:set_lore",
                  "mode": "append",
                  "lore": [
                    {
                      "translate": f"text.gm4.pneuma_{pneuma}",
                      "fallback": pneuma.replace("_", " ").title(),
                      "italic": False,
                      "color": "blue"
                    }
                  ]
                },
                {
                  "function": "minecraft:set_name",
                  "name": {
                    "translate": "item.gm4.soul_essence",
                    "fallback": "Soul Essence",
                    "italic": False,
                    "color": "white"
                  }
                },
                {
                  "function": "minecraft:set_components",
                  "components": {
                    "minecraft:enchantment_glint_override": True,
                    "minecraft:custom_model_data": f"pneuma/{pneuma}",
                    "minecraft:damage_resistant": {
                        "types": "#minecraft:is_fire"
                    },
                  }
                },
                {
                  "function": "minecraft:set_custom_data",
                  "tag": custom_data
                }
              ]
            }
          ]
        }
      ]
    })


def read_csv():
  # read csv file
  with open('gm4_orb_of_ankou/soul_essence.csv', mode ='r') as file:
    csv_file = csv.reader(file)

    # skip first 3 rows
    next(csv_file)
    next(csv_file)
    next(csv_file)

    for row in csv_file:
      # get info
      entity = row[0]
      essence = row[1]
      base_chance = float(row[2][0:-1])/100
      if entity not in entities:
        entities[entity] = {}
      entities[entity][essence] = round(base_chance,6)
      if essence not in pneumas:
        pneumas.append(essence)
      # calculate extra info
      entry = [entity,essence,str(round(base_chance*100,4))+'%',str(round(base_chance*400,3))+'%',str(round(base_chance*2500,3))+'%',str(round(base_chance*8200,2))+'%','',str(round(1/(base_chance*82),1)),str(round(13/(base_chance*82),1))]
      updated_csv.append(entry)

  # update calculated info
  with open('gm4_orb_of_ankou/soul_essence.csv', mode ='w', newline='') as file:
    csv_file = csv.writer(file)

    # skip first two rows
    csv_file.writerows(updated_csv)
