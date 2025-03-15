from typing import List
from beet import Context, Advancement, Function, DataPack
from beet.contrib.vanilla import Vanilla
from beet.core.utils import JsonDict
import math
from copy import deepcopy

class Entity:
    def __init__(self, entity_type: str, can_be_baby: bool, vertical_displacement: str, needs_enchantment: bool, can_dismount: bool):
        self.entity_type = entity_type
        self.vertical_displacement = vertical_displacement
        self.needs_enchantment = needs_enchantment
        self.can_be_baby = can_be_baby
        self.can_dismount = can_dismount

def beet_default(ctx: Context):
    """generates the advancements, the subsequent functions for handling reeling, and set_lookup_table.mcfunction
        NOTE: Only generates action functions for minecarts and chest boats. Others will have to be defined manually"""
    create_lookup_file(ctx)

    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.4'
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags

    entity_list: List[Entity] = []
    # Vertical displacement for mobs is -0.8 * the entities hitbox height. Entities with hitboxes that arent just width and height are different
    entity_list.append(Entity("minecraft:leash_knot",False,"-0.4",False,False))
    entity_list.append(Entity("minecraft:allay",False,"-0.48",True,True))
    entity_list.append(Entity("minecraft:shulker",False,"-0.8",False,True))
    entity_list.append(Entity("minecraft:end_crystal",False,"-1.6",False,False))
    entity_list.append(Entity("minecraft:fox",True,"-0.56",True,True))
    entity_list.append(Entity("minecraft:pig",True,"-0.72",True,True))
    entity_list.append(Entity("minecraft:strider",True,"-1.36",True,True))
    entity_list.append(Entity("minecraft:snow_golem", False, "-1.52",True,True))
    entity_list.append(Entity("minecraft:wolf",True,"-0.68",True,True))
    entity_list.append(Entity("minecraft:donkey",True,"-1.2",True,True))
    entity_list.append(Entity("minecraft:llama",True,"-1.496",True,True))
    entity_list.append(Entity("minecraft:trader_llama",True,"-1.496",True,True))
    
    for chest_boat in item_tags["minecraft:chest_boats"].data['values']:
        entity_list.append(Entity(chest_boat,False,"-0.45",True,False))
    for minecart in ["minecraft:chest_minecart","minecraft:furnace_minecart","minecraft:hopper_minecart","minecraft:tnt_minecart"]:
        entity_list.append(Entity(minecart,False,"-0.56",True,False))
    for special_hitbox in ["minecraft:painting","minecraft:item_frame", "minecraft:glow_item_frame"]:
        entity_list.append(Entity(special_hitbox,False,"-0.4",False,False))
    for villager_height in ["minecraft:witch","minecraft:villager"]:
        entity_list.append(Entity(villager_height,False,"-1.56",True,True))
    for horse_height in ["minecraft:mule","minecraft:horse", "minecraft:zombie_horse", "minecraft:skeleton_horse"]:
        entity_list.append(Entity(horse_height,True,"-1.28",True,True))
    create_files(ctx, entity_list)
'''
My goal for right now is to go to the maximum scope and then have things cut back.
Push this idea as far as I can, then reign it in.

    TODO:
        Figure out how to account for different hitbox heights :
            Different entity states. Like camel laying down, or player swimming
                Multiple checks in the adv function
            Slime Dismounting: Size Tag 
                Advancement checks? 
                    Would need an advancement and function for each size. Maybe just do the normal vanilla 3
                    Technically I could do all possible values..... But thats a lot of advancements
                Could have 3 separate checks in the adv function. Same as camel and player plans
            Attribute, minecraft:scale
                Catch 22. Can't factor it in because we need to use it to select the entity. Can't use it before selecting. 
        
        ALL DISMOUNT
            Add more mobs. Hopefully all....
        Piglin, Zomb Piglin, Piglin Brute, Bogged, 
        Skeleton, Stray, Husk, Drowned, Pillager, 
        Vindicator, Vex, Wither Skele, Zombie, Zomb Villager:
            Steal held item. No threat? Armor instead?
            Balance issues per mob
        Evoker :
            ????
        Illusioner :
            ????
        Player :
            Steal hand items?
            Armor? Too busted?
            Multiple hitbox sizes.....

    NOTE:   --- NO ---
        Enderman:       NOT FEASIBLE. Block state stored, not item data.
            Steal held block
            Could setblock with the block state, then get drop from breaking
            Could map block type to item, but that's far too much work and not maintainable
        Pufferfish :    Setting PuffState has issues. Also stupid hitbox changes size >:(
            Puff up a bit
        Sheep :         Would need a map from Color Byte to string. Annoying. Maybe revisit
            Shear?
        Wandering Trader :  Doesn't hold items. Maybe revist
            Theft Trades?
            Steal llamas?
'''

def create_lookup_file(ctx: Context):
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

# Function from:    https://www.geeksforgeeks.org/recursively-merge-dictionaries-in-python/
def recursive_merge(dict1:JsonDict, dict2:JsonDict):
    for key, value in dict2.items():
        if key in dict1 and isinstance(dict1[key], dict) and isinstance(value, dict):
            # Recursively merge nested dictionaries
            dict1[key] = recursive_merge(dict1[key], value) # type: ignore
        else:
            # Merge non-dictionary values
            dict1[key] = value
    return dict1

def create_adv_and_func(output_pack: DataPack, function_name: str, advancement_name: str,entity: Entity, run_on_entity: str, function_desc: str):
    entity_type_no_prefix = entity.entity_type.removeprefix('minecraft:')
    advancement_json : JsonDict = {
        "criteria":{
            "fishing_rod_hooked":{
                "trigger":"minecraft:fishing_rod_hooked",
                "conditions":{
                    "entity":{
                        "type" : entity.entity_type
                    }
                }
            }
        },
        "rewards":{
            "function": f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/{function_name}"
        }
    }
    if entity.needs_enchantment:
        recursive_merge(advancement_json,{
            "criteria":{
                "fishing_rod_hooked":{
                    "conditions":{
                        "rod":{
                            "predicates":{
                                "minecraft:enchantments":[
                                    {"enchantments":"gm4_reeling_rods:reeling"}
                                ]
                            }
                        }
                    }
                }
            }
        })
    adv_func : List[str] = [
        function_desc,
        "# @s = player who fished",
        "# at @s",
        f"# run from advancement gm4_reeling_rods:fishing/{advancement_name}",
        f"\nadvancement revoke @s only gm4_reeling_rods:fishing/{advancement_name}",
        "\nexecute if entity @s[gamemode=adventure] run return fail",
        "\nfunction gm4_reeling_rods:store_player_pos",
        "\ntag @s add gm4_reeling_rods.player\n",
        "execute as @e[type=minecraft:fishing_bobber,distance=..33] \\",
        "\tif function gm4_reeling_rods:fishing/owns_bobber \\",
        f"\tat @s positioned ~ ~{entity.vertical_displacement} ~ \\",
        f"\tas @e[type={entity.entity_type},distance=..0.00001,limit=1] \\",
        "\tunless data entity @s {Invulnerable:1b} unless data entity @s Tags[] \\",
        run_on_entity,
        "\ntag @s remove gm4_reeling_rods.player"
    ]
    if entity.can_be_baby:
        # change normal advancement to be for explicitly not baby
        recursive_merge(advancement_json,{
            "criteria":{
                "fishing_rod_hooked":{
                    "conditions":{
                        "entity":{
                            "flags":{
                                "is_baby": False
                            }
                        }
                    }
                }
            }
        })
        # new advancement for explicitly baby
        advancement_json_baby:JsonDict = deepcopy(advancement_json)
        recursive_merge(advancement_json_baby,{
            "criteria":{
                "fishing_rod_hooked":{
                    "conditions":{
                        "entity":{
                            "flags":{
                                "is_baby": True
                            }
                        }
                    }
                }
            },
            "rewards":{
                "function": f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/{function_name}_baby"
            }
        })
        adv_func_baby = deepcopy(adv_func)
        adv_func_baby[0] = f"{function_desc}_baby"
        adv_func_baby[3] = f"# run from advancement gm4_reeling_rods:fishing/{advancement_name}_baby"
        adv_func_baby[4] = f"\nadvancement revoke @s only gm4_reeling_rods:fishing/{advancement_name}_baby"
        adv_func_baby[10] = f"\tat @s positioned ~ ~{str(float(entity.vertical_displacement) / 2)} ~ \\"

        output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/{function_name}_baby"] = Function(adv_func_baby)
        output_pack[f"gm4_reeling_rods:fishing/{advancement_name}_baby"] = Advancement(advancement_json_baby)

    output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/{function_name}"] = Function(adv_func)
    output_pack[f"gm4_reeling_rods:fishing/{advancement_name}"] = Advancement(advancement_json)

def create_files(ctx: Context, entities: List[Entity]):
    for entity in entities:
        since_61 = "pale_oak" in entity.entity_type
        is_chest_boat = "chest_boat" in entity.entity_type or "chest_raft" in entity.entity_type
        output_pack = ctx.data.overlays["since_61"] if since_61 else ctx.data.overlays["since_57"] if is_chest_boat else ctx.data
        entity_type_no_prefix = entity.entity_type.removeprefix('minecraft:')
        create_adv_and_func(
            output_pack,
            "adv",
            entity_type_no_prefix,
            entity,
            f"\trun function gm4_reeling_rods:fishing/{entity_type_no_prefix}/action",
            f"# Initial Logic for rod reeling {entity_type_no_prefix}"
        )
        # Some generated action files
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
        elif is_chest_boat: # chest boats / raft specific
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
        elif "_horse" in entity.entity_type: # skele and zombie horses
            output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"] = Function([
                f"# Action for reeled {entity_type_no_prefix}",
                f"# @s = {entity_type_no_prefix}",
                "# at @s",
                f"# run from gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv",
                "\ndata modify storage gm4_reeling_rods:temp item_data set value {}",
                "data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SaddleItem",
                "execute positioned ~ ~0.8 ~ run function gm4_reeling_rods:separate",
                "execute if data storage gm4_reeling_rods:temp {item_data:{Item:{id:\"minecraft:saddle\"}}} run item replace entity @s horse.saddle with minecraft:air"
            ])
        elif "llama" in entity.entity_type: # llama and trader_llama
            output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"] = Function([
                f"# Action for reeled {entity_type_no_prefix}",
                f"# @s = {entity_type_no_prefix}",
                "# at @s",
                f"# run from gm4_reeling_rods:fishing/{entity_type_no_prefix}/adv",
                "\ndata modify storage gm4_reeling_rods:temp entity_data set from entity @s",
                "data modify storage gm4_reeling_rods:temp item_data set value {}",
                "data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s body_armor_item",
                "execute if data entity @s {ChestedHorse:1b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:\"minecraft:chest\",count:1}",
                "execute positioned ~ ~1 ~ run function gm4_reeling_rods:separate",
                "execute if data entity @s {ChestedHorse:1b} run return run data modify entity @s ChestedHorse set value 0b",
                "item replace entity @s armor.body with minecraft:air"
            ])
        if entity.can_dismount: # Dismounting logic
            if entity.needs_enchantment:    # Make a new advancement and adv func for dismounting, with no enchant needed
                create_adv_and_func(
                    output_pack,
                    "adv_dismount",
                    f"{entity_type_no_prefix}_dismount",
                    Entity(
                        entity.entity_type,
                        entity.can_be_baby,
                        entity.vertical_displacement,
                        False,
                        entity.can_dismount
                    ),
                    f"\tif function gm4_reeling_rods:fishing/is_passenger run ride @s dismount",
                    f"# Logic for rod dismounting {entity_type_no_prefix}"
                )
            else:   # prepend dismounting logic to action function
                actionFunc = output_pack.functions.get(f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action")
                if actionFunc != None:  # if existing action, prepend dismounting
                    actionFunc.prepend(Function([
                        "# dismounting logic",
                        "execute if function gm4_reeling_rods:fishing/is_passenger run return run ride @s dismount\n\n"
                    ]))
                else:   # if no action function, make one thats just dismounting
                    output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"] = Function([
                        "# dismounting logic",
                        "execute if function gm4_reeling_rods:fishing/is_passenger run return run ride @s dismount"
                    ])
