from typing import List
from beet import Context, Advancement, Function, DataPack
import math
from pathlib import Path
from gm4.utils import CSV

def beet_default(ctx: Context):
    """NOTE: generates files
        - set_lookup_table
        - advancements and reward functions for every bit state of an entity's tagged id
        - fishing/select_type and overlays of it
    """
    create_lookup_file(ctx)
    create_bit_advancements(ctx)

    entity_list =  CSV.from_file(Path('gm4_reeling_rods','entities.csv'))
    
    create_select_type(ctx, entity_list)
'''
My goal for right now is to go to the maximum scope and then have things cut back.
Push this idea as far as I can, then reign it in.

    TODO: Hand & Armor Yoinking
        Treat this as an action. No entity should have an action AND have item theft
        Therefore, it should take place after a failed dismount
        As a consequence of no overlap, we can just return run the theft function, no need to conditional it
    
        Should pull a random of those that exist
            Use the random check order that you have in your notebook
        Yoinked item height.
            Previously, in manually defined yoinking, the item height was hard coded per entity
            This is not easily possible with a generic item yoink
            What do we do?
            We could pass a value with a macro, same principal as hard coding the value, not pretty but it works
            Is it possible to get the entity hitbox height? If we can then we can math out the location
        Use a type tag list for which entities can have items yoinked
        
        
        NOTE: Specific Entities
            Villagers:
                -{ Special Exception }-
                Currently are set up as a manually defined mainhand theft with reputational harm and trade sell out
                Needs to implement theft for armor as well (armor can be dispensed onto them; only head renders)
                Does the armor theft cause reputational damage to player?
            Illagers:
                [ Vindicator, Vex, Pillager, Illusioner, Evoker? ]
                Can have armor on them through commands (not dispensed), but doesn't render
                Probably shouldn't theft armor that can't be applied by players, that's the realm of datapackers
                Should use a special hand item theft function
            Fox, Allay, Witch:
                Needs to have old code scrapped
                Cannot have armor (<1.21.5)
                Should use a special hand item theft funciton (for clarity)
            Player:
                Try to implement using the generic entity item yoinking
                But if there's player specific problems, just split player off into a special case
            All the rest:
                [ Bogged, Skeleton, Stray, Wither Skeleton ]
                [ Husk, Drowned, Zombie, Zombie Villager ]
                [ Piglin, Piglin Brute, Zombie Piglin ]
                
                Steal armor or hand item just fine
                Nugget idea?
                    Try to use drop chances for armor and if it fails drop armor material?
                    What about datapack armor?... I worry about compatibility


    \\ ---[ REJECTED FOR A REASON ]--- \\
        Enderman :
            Steal held block
            ISSUE: Block state stored, not item data.
            Could setblock with the block state, then get drop from breaking
            Could map block type to item, but that's far too much work and not maintainable
        Pufferfish :
            Puff up a bit
            ISSUE: Setting PuffState has issues. Set once is fine. Once it deflates a bit, setting again flashes and then reverts. 
            Probably an MC bug, should make an issue for it if it doesn't exist
        Sheep :
            Shear?
            ISSUE: Would need to map from Color Byte to string. Annoying. Maybe revisit
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
                "execute if entity @s[gamemode=adventure] run return fail\n",
                "data modify storage gm4_reeling_rods:temp bit_data set value {bit_tag:\"" + f"gm4_reeling_rods.id.{bit}.{value}\", bit:\"{bit}\"" + "}",
                "data remove storage gm4_reeling_rods:temp enchanted",
                "execute if predicate gm4_reeling_rods:holding_reeling_rod run data modify storage gm4_reeling_rods:temp enchanted set value 1",
                "function gm4_reeling_rods:store_player_pos",
                "tag @s add gm4_reeling_rods.player",
                "function gm4_reeling_rods:player/received_bit with storage gm4_reeling_rods:temp bit_data",
                "tag @s remove gm4_reeling_rods.player"
            ])

def create_select_type(ctx: Context, entities: CSV):
    selectFuncBase: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after failed dismount"]]
    selectFuncSince61: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after failed dismount"]]
    selectFuncBackport48: List[List[str]] = [["# non-dismount entities"],["# dismountable entities, action after failed dismount"]]
    for entity in entities:
        since_61 = "pale_oak" in entity['id']
        backport_48 = "minecraft:chest_boat" in entity['id']
        since_57 = "_chest_boat" in entity['id'] or "_chest_raft" in entity['id']

        order = 1 if entity['can_dismount'] == "TRUE" else 0     # other action before or after dismounting logic
        writeTo = [selectFuncSince61] if since_61 else [selectFuncBackport48] if backport_48 else [selectFuncBase, selectFuncSince61] if since_57 else [selectFuncBackport48, selectFuncBase, selectFuncSince61]
        # since_61      gets since_61, since_57, else
        # base          gets since_57, else
        # backport_48   gets backport_48, else
        for write in writeTo:
            command = f"execute if entity @s[type={entity['id']}] run return "
            if entity['needs_enchantment'] == "TRUE":
                command = command + "run execute if data storage gm4_reeling_rods:temp enchanted "
            command = command + entity['command']
            write[order].append(command)
    finalSelectFunction(selectFuncBase, ctx.data.overlays["since_57"]) # should just be ctx.data when moved to 1.21.5, these overlays are gonna be a nightmare to update.,., Figure it out later
    finalSelectFunction(selectFuncSince61, ctx.data.overlays["since_61"])
    finalSelectFunction(selectFuncBackport48, ctx.data.overlays["backport_48"])

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
