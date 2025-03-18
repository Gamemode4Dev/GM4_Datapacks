from typing import List
from beet import Context, Advancement, Function, DataPack 
from beet.contrib.vanilla import Vanilla
import math

class Entity:
    def __init__(self, entity_type: str, needs_enchantment: bool, can_dismount: bool):
        self.entity_type = entity_type
        self.needs_enchantment = needs_enchantment
        self.can_dismount = can_dismount

def beet_default(ctx: Context):
    """generates the advancements, the subsequent functions for handling reeling, and set_lookup_table.mcfunction
        NOTE: Only generates action functions for minecarts and chest boats. Others will have to be defined manually"""
    create_lookup_file(ctx)
    create_bit_advancements(ctx)

    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.4'
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags

    entity_list: List[Entity] = []
    entity_list.append(Entity("minecraft:leash_knot",False,False))
    entity_list.append(Entity("minecraft:allay",True,True))
    entity_list.append(Entity("minecraft:shulker",False,True))
    entity_list.append(Entity("minecraft:end_crystal",False,False))
    entity_list.append(Entity("minecraft:fox",True,True))
    entity_list.append(Entity("minecraft:pig",True,True))
    entity_list.append(Entity("minecraft:strider",True,True))
    entity_list.append(Entity("minecraft:snow_golem",True,True))
    entity_list.append(Entity("minecraft:wolf",True,True))
    entity_list.append(Entity("minecraft:donkey",True,True))
    entity_list.append(Entity("minecraft:llama",True,True))
    entity_list.append(Entity("minecraft:trader_llama",True,True))
    
    for chest_boat in item_tags["minecraft:chest_boats"].data['values']:
        entity_list.append(Entity(chest_boat,True,False))
    entity_list.append(Entity("minecraft:chest_boat",True,False))
    for minecart in ["minecraft:chest_minecart","minecraft:furnace_minecart","minecraft:hopper_minecart","minecraft:tnt_minecart"]:
        entity_list.append(Entity(minecart,True,False))
    for special_hitbox in ["minecraft:painting","minecraft:item_frame", "minecraft:glow_item_frame"]:
        entity_list.append(Entity(special_hitbox,False,False))
    for villager_height in ["minecraft:witch","minecraft:villager"]:
        entity_list.append(Entity(villager_height,True,True))
    for horse_height in ["minecraft:mule","minecraft:horse", "minecraft:zombie_horse", "minecraft:skeleton_horse"]:
        entity_list.append(Entity(horse_height,True,True))
    create_select_type(ctx, entity_list)
'''
My goal for right now is to go to the maximum scope and then have things cut back.
Push this idea as far as I can, then reign it in.

    TODO:
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
        Pufferfish :
            Puff up

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

def create_bit_advancements(ctx: Context):
    for bit in range(16):
        for value in range(2):
            # default adv
            ctx.data[f"gm4_reeling_rods:fishing/bit_{bit}_{value}"] = Advancement({
                "criteria":{
                    "fishing_rod_hooked":{
                        "trigger":"minecraft:fishing_rod_hooked",
                        "conditions":{
                            "entity":{
                                "nbt": "{" + f"Tags:[\"gm4_reeling_rods.id.{bit}.{value}\"]" + "}"
                            }
                        }
                    }
                },
                "rewards":{
                    "function": f"gm4_reeling_rods:player/bit_{bit}_{value}"
                }
            })
            ctx.data[f"gm4_reeling_rods:player/bit_{bit}_{value}"] = Function([
                f"# player adv logic for getting bit {bit} at value {value}",
                f"# run from advancement fishing/bit_{bit}_{value}\n",
                f"advancement revoke @s only gm4_reeling_rods:fishing/bit_{bit}_{value}\n",
                "data modify storage gm4_reeling_rods:temp bit_data set value {bit_tag:\"" + f"gm4_reeling_rods.id.{bit}.{value}\", bit:\"{bit}\"" + "}",
                "data remove storage gm4_reeling_rods:temp enchanted",
                "execute if predicate gm4_reeling_rods:holding_reeling_rod run data modify storage gm4_reeling_rods:temp enchanted set value 1",
                "function gm4_reeling_rods:store_player_pos",
                "tag @s add gm4_reeling_rods.player",
                "function gm4_reeling_rods:player/received_bit with storage gm4_reeling_rods:temp bit_data",
                "tag @s remove gm4_reeling_rods.player"
            ])

def finalSelectFunction(strings: List[List[str]], output_pack: DataPack):
    finalFunction: List[str] = [
        "# GENERATED from generate_files.py",
        "# Selects the right entity type or dismounts the entity",
        "# @s = fished entity",
        "# at @s",
        "# run from player/find_fished_entity\n"
    ]
    for line in strings[0]:
        finalFunction.append(line)
    finalFunction.append("\n# dismounting logic\nexecute if function gm4_reeling_rods:fishing/is_passenger run return run ride @s dismount\n")
    for line in strings[1]:
        finalFunction.append(line)
    output_pack["gm4_reeling_rods:fishing/select_type"] = Function(finalFunction)

def create_select_type(ctx: Context, entities: List[Entity]):
    selectFuncBase: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after dismount"]]
    selectFuncSince61: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after dismount"]]
    selectFuncBackport48: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after dismount"]]
    for entity in entities:
        since_61 = "pale_oak" in entity.entity_type
        backport_48 = "minecraft:chest_boat" in entity.entity_type
        since_57 = "_chest_boat" in entity.entity_type or "_chest_raft" in entity.entity_type
        entity_type_no_prefix = entity.entity_type.removeprefix('minecraft:')

        # generate an action if its one of those types
        generated_action(
            ctx.data.overlays["since_61"] if since_61 else ctx.data.overlays["backport_48"] if backport_48 else ctx.data.overlays["since_57"] if since_57 else ctx.data,
            entity
        )

        order = 1 if entity.can_dismount else 0     # other action before or after dismounting logic
        writeTo = [selectFuncSince61] if since_61 else [selectFuncBackport48] if backport_48 else [selectFuncBase, selectFuncSince61] if since_57 else [selectFuncBackport48, selectFuncBase, selectFuncSince61]
        # since_61      gets since_61, since_57, else
        # base          gets since_57, else
        # backport_48   gets backport_48, else
        for write in writeTo:
            command = f"execute if entity @s[type={entity.entity_type}] "
            if entity.needs_enchantment:
                command = command + "if data storage gm4_reeling_rods:temp enchanted "
            command = command + f"run return run function gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"
            write[order].append(command)
    finalSelectFunction(selectFuncBase, ctx.data)
    finalSelectFunction(selectFuncSince61, ctx.data.overlays["since_61"])
    finalSelectFunction(selectFuncBackport48, ctx.data.overlays["backport_48"])


def generated_action(output_pack: DataPack, entity: Entity):
    entity_type_no_prefix = entity.entity_type.removeprefix('minecraft:')
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
        return
    if "chest" in entity.entity_type: # chest boats / raft specific
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
        return
    if "_horse" in entity.entity_type: # skele and zombie horses
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
        return
    if "llama" in entity.entity_type: # llama and trader_llama
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
        return
