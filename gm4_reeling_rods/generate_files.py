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
    """generates files
        - set_lookup_table
        - advancements and reward functions for every bit state of an entity's tagged id
        - fishing/select_type and overlays
        - a few action functions for specified entity types
    """
    create_lookup_file(ctx)
    create_bit_advancements(ctx)

    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.4'
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags

    # Here we define all entities with a specific action, those not listed will simply dismount if possible
    needsEnchant_canDismount: List[str] = [
        "minecraft:allay", "minecraft:fox", "minecraft:pig",
        "minecraft:strider", "minecraft:snow_golem", "minecraft:wolf",
        "minecraft:donkey", "minecraft:llama", "minecraft:trader_llama",
        "minecraft:witch","minecraft:villager", "minecraft:mule",
        "minecraft:horse", "minecraft:zombie_horse", "minecraft:skeleton_horse"
    ]
    noEnchant_canDismount: List[str] = [
        "minecraft:shulker"
    ]
    needsEnchant_noDismount: List[str] = [
        "minecraft:chest_minecart", "minecraft:furnace_minecart", "minecraft:hopper_minecart",
        "minecraft:tnt_minecart", "minecraft:chest_boat"
    ]
    for chest_boat in item_tags["minecraft:chest_boats"].data['values']:
        needsEnchant_noDismount.append(chest_boat)
    
    noEnchant_noDismount: List[str] = [
        "minecraft:leash_knot", "minecraft:end_crystal", "minecraft:painting",
        "minecraft:item_frame", "minecraft:glow_item_frame"
    ]
    
    entity_list: List[Entity] = []
    for name in needsEnchant_canDismount:
        entity_list.append(Entity(name,True,True))
    for name in noEnchant_canDismount:
        entity_list.append(Entity(name,False,True))
    for name in needsEnchant_noDismount:
        entity_list.append(Entity(name,True,False))
    for name in noEnchant_noDismount:
        entity_list.append(Entity(name,False,False))
    
    create_select_type(ctx, entity_list)
'''
My goal for right now is to go to the maximum scope and then have things cut back.
Push this idea as far as I can, then reign it in.

    TODO:
    Hand & Armor Yoinking
        Should pull a random of those that exist

        Villagers can have armor dispensed onto them, but only the head slot will render
        Illager types can have armor on them through commands, but it doesn't render. Ignore armor then

        Should return success of yoinking and have select_type return if yoinked item. I think, idk, i'll figure it out later
    
    
        Bogged, Skeleton, Stray, Wither Skele,
        Husk, Drowned, Zombie, Zomb Villager,
        Piglin, Zomb Piglin, Piglin Brute, 
        Player, Villager, Allay, Witch:
            Random item of hand or armor
            Player might need special handling
            Villager will need special handling due to consequences
            Allay and Witch can't have armor, but that means it should just fail
                They also need to be revisted and have the old code scrapped
        Vindicator, Vex, Pillager, Illusioner:
            Random of Hands
            Can have armor with commands, but we don't want to yoink?
            What if we did? Would it actually be a problem?

    NOTE:   --- NO ---
        Enderman :
            Steal held block
            ISSUE: Block state stored, not item data.
            Could setblock with the block state, then get drop from breaking
            Could map block type to item, but that's far too much work and not maintainable
        Pufferfish :
            Puff up a bit
            ISSUE: Setting PuffState has issues. Set once is fine. Once it deflates a bit, setting again flashes and then reverts. 
            Probably an MC bug
        Sheep :
            Shear?
            ISSUE: Would need a map from Color Byte to string. Annoying. Maybe revisit
        Wandering Trader :  Doesn't hold items. Maybe revist
            Theft Trades?
            Steal llamas?
        Evoker :
            No Ideas
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
                "execute if entity @s[gamemode=adventure] run return fail\n",
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
    # entities that don't dismount
    for line in strings[0]:
        finalFunction.append(line)
    # dismount logic
    finalFunction.append("\n# dismounting logic\nexecute if function gm4_reeling_rods:fishing/is_passenger run return run ride @s dismount\n")
    # entities that do dismount, only runs if not dismounting
    for line in strings[1]:
        finalFunction.append(line)
    output_pack["gm4_reeling_rods:fishing/select_type"] = Function(finalFunction)

def create_select_type(ctx: Context, entities: List[Entity]):
    selectFuncBase: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after failed dismount"]]
    selectFuncSince61: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after failed dismount"]]
    selectFuncBackport48: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after failed dismount"]]
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
            command = f"execute if entity @s[type={entity.entity_type}] run return "
            if entity.needs_enchantment:
                command = command + "run execute if data storage gm4_reeling_rods:temp enchanted "
            command = command + f"run function gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"
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
            f"# run from gm4_reeling_rods:fishing/select_type",
            "\ndata modify storage gm4_reeling_rods:temp entity_data set from entity @s",
            "data modify storage gm4_reeling_rods:temp item_data.Item set value {id:\"" + entity.entity_type.removesuffix('_minecart') + "\",count:1}",
            "function gm4_reeling_rods:separate",
            "data remove storage gm4_reeling_rods:temp entity_data.UUID",
            "data remove storage gm4_reeling_rods:temp entity_data.Passengers",
            "data modify storage gm4_reeling_rods:temp entity_type set value \"minecraft:minecart\"",
            "function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp",
            f"execute on passengers run function gm4_reeling_rods:fishing/minecart_passenger_transfer",
            "tp @s ~ -1000 ~",
        ])
        # technically this is generated 4 times, but its just one file, so uh idk
        output_pack[f"gm4_reeling_rods:fishing/minecart_passenger_transfer"] = Function([
            "# transfer old passenger to new minecart",
            f"# @s = passengers of {entity_type_no_prefix}",
            f"# at old {entity_type_no_prefix}",
            "# run from gm4_reeling_rods:fishing/{all_minecart}/action",
            "\nride @s dismount",
            "ride @s mount @e[type=minecraft:minecart,distance=..0.00001,limit=1]"
        ])
        return
    if "chest" in entity.entity_type: # chest boats / raft specific
        output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/action"] = Function([
            f"# Action for reeled {entity_type_no_prefix}",
            f"# @s = {entity_type_no_prefix}",
            "# at @s",
            f"# run from gm4_reeling_rods:fishing/select_type",
            "\ndata modify storage gm4_reeling_rods:temp entity_data set from entity @s",
            "data modify storage gm4_reeling_rods:temp item_data.Item set value {id:\"minecraft:chest\",count:1}",
            "execute positioned ~ ~0.75 ~ run function gm4_reeling_rods:separate",
            "data remove storage gm4_reeling_rods:temp entity_data.UUID",
            "data remove storage gm4_reeling_rods:temp entity_data.Passengers",
            f"data modify storage gm4_reeling_rods:temp entity_type set value \"{entity.entity_type.replace('_chest','')}\"",
            "function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp",
            f"execute on passengers run function gm4_reeling_rods:fishing/{entity_type_no_prefix}/passenger_transfer",
            "tp @s ~ -1000 ~"
        ])
        output_pack[f"gm4_reeling_rods:fishing/{entity_type_no_prefix}/passenger_transfer"] = Function([
            "# transfer old passenger to new boat",
            f"# @s = passengers of {entity_type_no_prefix}",
            f"# at old {entity_type_no_prefix}",
            f"# run from gm4_reeling_rods:fishing/{entity_type_no_prefix}/action",
            "\nride @s dismount",
            f"ride @s mount @e[type={entity.entity_type.replace('_chest','')},distance=..0.00001,limit=1]"
        ])
        return
    if "_horse" in entity.entity_type: # skele and zombie horses
        output_pack[f"gm4_reeling_rods:fishing/select_type"] = Function([
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
        output_pack[f"gm4_reeling_rods:fishing/select_type"] = Function([
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
