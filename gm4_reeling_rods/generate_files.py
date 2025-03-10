from typing import List
from beet import Context, Advancement, Function
from beet.contrib.vanilla import Vanilla
import math

class Entity:
    def __init__(self, entity_type: str, vertical_displacement: str, needs_enchantment: bool):
        self.entity_type = entity_type
        self.vertical_displacement = vertical_displacement
        self.needs_enchantment = needs_enchantment

def beet_default(ctx: Context):
    """generates the advancements, the subsequent functions for handling reeling, and set_lookup_table.mcfunction
        NOTE: Only generates action functions for minecarts and chest boats. Others will have to be defined manually"""
    
    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.4'

    def create_files(entities: List[Entity]):
        for entity in entities:
            since_61 = "pale_oak" in entity.entity_type
            is_chest_boat = "chest_boat" in entity.entity_type or "chest_raft" in entity.entity_type
            output_pack = ctx.data.overlays["since_61"] if since_61 else ctx.data.overlays["since_57"] if is_chest_boat else ctx.data
            entity_type_no_prefix = entity.entity_type.removeprefix('minecraft:')
            output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv"] = Function([
                f"# Initial Logic for rod reeling {entity_type_no_prefix}",
                "# @s = player who fished",
                "# at @s",
                f"# run from advancement gm4_reeling_rods:fishing/{entity_type_no_prefix}",
                f"\nadvancement revoke @s only gm4_reeling_rods:fishing/{entity_type_no_prefix}",
                "\nexecute if entity @s[gamemode=adventure] run return fail",
                "\nfunction gm4_reeling_rods:store_player_pos",
                "\ntag @s add gm4_reeling_rods.player\n",
                "execute as @e[type=minecraft:fishing_bobber,distance=..33] \\",
                "\tif function gm4_reeling_rods:fishing/owns_bobber \\",
                f"\tat @s positioned ~ ~{entity.vertical_displacement} ~ \\",
                f"\tas @e[type={entity.entity_type},distance=..0.00001,limit=1] \\",
                "\tunless data entity @s {Invulnerable:1b} unless data entity @s Tags[] \\",
                f"\trun function gm4_reeling_rods:fishing/{entity_type_no_prefix}/action",
                "\ntag @s remove gm4_reeling_rods.player"
            ])
            if entity.needs_enchantment:
                output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}"] = Advancement({
                    "criteria":{
                        "fishing_rod_hooked":{
                            "trigger": "minecraft:fishing_rod_hooked",
                            "conditions": {
                                "rod": {
                                    "predicates": {
                                        "minecraft:enchantments": [
                                            {
                                                "enchantments": "gm4_reeling_rods:reeling"
                                            }
                                        ]
                                    }
                                },
                                "entity": {
                                    "type": entity.entity_type
                                }
                            }
                        }
                    },
                    "rewards": {
                        "function": f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv"
                    }
                })
            else:
                output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}"] = Advancement({
                    "criteria":{
                        "fishing_rod_hooked":{
                            "trigger":"minecraft:fishing_rod_hooked",
                            "conditions":{
                                "entity":{
                                    "type": entity.entity_type
                                }
                            }
                        }
                    },
                    "rewards":{
                        "function": f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv"
                    }
                })
            if not ("minecart" in entity.entity_type or is_chest_boat): # Other entity types need to have actions defined manually
                continue
            if "minecart" in entity.entity_type: # minecart types
                output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"] = Function([
                    f"# Action for reeled {entity_type_no_prefix}",
                    f"# @s = {entity_type_no_prefix}",
                    "# at @s",
                    f"# run from gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv",
                    "\ndata modify storage gm4_reeling_rods:temp entity_data set from entity @s",
                    "data modify storage gm4_reeling_rods:temp item_data.Item set value {id:\"" + entity.entity_type.removesuffix('_minecart') + "\",count:1}",
                    "function gm4_reeling_rods:separate",
                    "tp @s ~ -1000 ~",
                    "data remove storage gm4_reeling_rods:temp entity_data.UUID",
                    "data modify storage gm4_reeling_rods:temp entity_type set value \"minecraft:minecart\"",
                    "function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp"
                ])
                continue
            if is_chest_boat: # chest boats / raft specific
                output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"] = Function([
                    f"# Action for reeled {entity_type_no_prefix}",
                    f"# @s = {entity_type_no_prefix}",
                    "# at @s",
                    f"# run from gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv",
                    "\ndata modify storage gm4_reeling_rods:temp entity_data set from entity @s",
                    "data modify storage gm4_reeling_rods:temp item_data.Item set value {id:\"minecraft:chest\",count:1}",
                    "execute positioned ~ ~0.75 ~ run function gm4_reeling_rods:separate",
                    "tp @s ~ -1000 ~",
                    "data remove storage gm4_reeling_rods:temp entity_data.UUID",
                    f"data modify storage gm4_reeling_rods:temp entity_type set value \"{entity.entity_type.replace('_chest','')}\"",
                    "function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp"
                ])
                continue
    
    def create_lookup_file():
        lookup_keys = [0]
        for dx in range(0,34):
            for dy in range(0,34):
                for dz in range(0,34):
                    potenital_key = (dx * dx) + (dy * dy) + (dz * dz)
                    if (math.sqrt(potenital_key) > 33): # ignore values out of fishing bobber range
                        continue
                    if potenital_key in lookup_keys:    # ignore if already found
                        continue
                    lookup_keys.append(potenital_key)
        lookup_keys.sort()
        strList: List[str] = []
        for key in lookup_keys:
            value = math.floor(100*(0.08*math.sqrt(math.sqrt(key))))
            strList.append(f"scoreboard players set ${key} gm4_reeling_rods.lookup {value}")
        ctx.data["gm4_reeling_rods:set_lookup_table"] = Function(strList)
    
    entity_list: List[Entity] = []
    
    entity_list.append(Entity("minecraft:painting","-0.4",False))
    entity_list.append(Entity("minecraft:item_frame","-0.4",False))
    entity_list.append(Entity("minecraft:glow_item_frame","-0.4",False))
    entity_list.append(Entity("minecraft:leash_knot","-0.4",False))
    entity_list.append(Entity("minecraft:allay","-0.48",True))
    entity_list.append(Entity("minecraft:chest_minecart","-0.55999",True))
    entity_list.append(Entity("minecraft:furnace_minecart","-0.55999", True))
    entity_list.append(Entity("minecraft:hopper_minecart","-0.55999", True))
    entity_list.append(Entity("minecraft:tnt_minecart","-0.55999",True))
    entity_list.append(Entity("minecraft:shulker","-0.8",False))
    entity_list.append(Entity("minecraft:end_crystal","-1.6",False))
    
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags
    for chest_boat in item_tags["minecraft:chest_boats"].data['values']:
        entity_list.append(Entity(chest_boat,"-0.45",True))
    
    create_files(entity_list)
    create_lookup_file()
    