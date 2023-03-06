from beet import Context, Function, ItemTag, LootTable, Predicate
from beet.contrib.vanilla import Vanilla
from itertools import groupby
from typing import Any, Callable
from dataclasses import dataclass


NAMESPACE = "gm4_auto_crafting"      # name of the module
LOOT_PATH = "crafting/vanilla"
BRANCH_PATH = "check_recipes"    # folder where all the search tree stuff will take place

buckets = [
    "minecraft:axolotl_bucket",
    "minecraft:cod_bucket",
    "minecraft:lava_bucket",
    "minecraft:milk_bucket",
    "minecraft:powder_snow_bucket",
    "minecraft:pufferfish_bucket",
    "minecraft:salmon_bucket",
    "minecraft:tropical_fish_bucket",
    "minecraft:water_bucket"
]

bottles = [
    "minecraft:dragon_breath",
    "minecraft:honey_bottle",
    "minecraft:potion"
]

## DO NOT CHANGE ORDER OF THIS LIST
unstackables = [
    "minecraft:shulker_box",                # stacksTo(1)
    "minecraft:white_shulker_box",
    "minecraft:orange_shulker_box",
    "minecraft:magenta_shulker_box",
    "minecraft:light_blue_shulker_box",
    "minecraft:yellow_shulker_box",
    "minecraft:lime_shulker_box",
    "minecraft:pink_shulker_box",
    "minecraft:gray_shulker_box",
    "minecraft:light_gray_shulker_box",
    "minecraft:cyan_shulker_box",
    "minecraft:purple_shulker_box",
    "minecraft:blue_shulker_box",
    "minecraft:brown_shulker_box",
    "minecraft:green_shulker_box",
    "minecraft:red_shulker_box",
    "minecraft:black_shulker_box",
    "minecraft:saddle",
    "minecraft:minecart",
    "minecraft:chest_minecart",
    "minecraft:furnace_minecart",
    "minecraft:tnt_minecart",
    "minecraft:hopper_minecart",
    "minecraft:oak_boat",
    "minecraft:spruce_boat",
    "minecraft:birch_boat",
    "minecraft:jungle_boat",
    "minecraft:acacia_boat",
    "minecraft:dark_oak_boat",
    "minecraft:mangrove_boat",
    "minecraft:mushroom_stew",
    "minecraft:water_bucket",
    "minecraft:lava_bucket",
    "minecraft:powder_snow_bucket",
    "minecraft:milk_bucket",
    "minecraft:pufferfish_bucket",
    "minecraft:salmon_bucket",
    "minecraft:cod_bucket",
    "minecraft:tropical_fish_bucket",
    "minecraft:axolotl_bucket",
    "minecraft:tadpole_bucket",
    "minecraft:bundle",
    "minecraft:spyglass",
    "minecraft:cake",
    "minecraft:white_bed",
    "minecraft:orange_bed",
    "minecraft:magenta_bed",
    "minecraft:light_blue_bed",
    "minecraft:yellow_bed",
    "minecraft:lime_bed",
    "minecraft:pink_bed",
    "minecraft:gray_bed",
    "minecraft:light_gray_bed",
    "minecraft:cyan_bed",
    "minecraft:purple_bed",
    "minecraft:blue_bed",
    "minecraft:brown_bed",
    "minecraft:green_bed",
    "minecraft:red_bed",
    "minecraft:black_bed",
    "minecraft:potion",
    "minecraft:writable_book",
    "minecraft:enchanted_book",
    "minecraft:rabbit_stew",
    "minecraft:iron_horse_armor",
    "minecraft:golden_horse_armor",
    "minecraft:diamond_horse_armor",
    "minecraft:leather_horse_armor",
    "minecraft:command_block_minecart",
    "minecraft:beetroot_soup",
    "minecraft:splash_potion",
    "minecraft:lingering_potion",
    "minecraft:totem_of_undying",
    "minecraft:knowledge_book",
    "minecraft:debug_stick",
    "minecraft:music_disc_13",
    "minecraft:music_disc_cat",
    "minecraft:music_disc_blocks",
    "minecraft:music_disc_chirp",
    "minecraft:music_disc_far",
    "minecraft:music_disc_mall",
    "minecraft:music_disc_mellohi",
    "minecraft:music_disc_stal",
    "minecraft:music_disc_strad",
    "minecraft:music_disc_ward",
    "minecraft:music_disc_11",
    "minecraft:music_disc_wait",
    "minecraft:music_disc_otherside",
    "minecraft:music_disc_pigstep",
    "minecraft:crossbow",
    "minecraft:suspicious_stew",
    "minecraft:flower_banner_pattern",
    "minecraft:creeper_banner_pattern",
    "minecraft:skull_banner_pattern",
    "minecraft:mojang_banner_pattern",
    "minecraft:globe_banner_pattern",
    "minecraft:piglin_banner_pattern",
    "minecraft:carrot_on_a_stick",
    "minecraft:warped_fungus_on_a_stick",   # durability
    "minecraft:elytra",
    "minecraft:flint_and_steel",
    "minecraft:bow",
    "minecraft:fishing_rod",
    "minecraft:shears",
    "minecraft:shield",
    "minecraft:trident",
    "minecraft:wooden_sword",               # SwordItem
    "minecraft:stone_sword",
    "minecraft:golden_sword",
    "minecraft:iron_sword",
    "minecraft:diamond_sword",
    "minecraft:netherite_sword",
    "minecraft:wooden_axe",                 # AxeItem
    "minecraft:stone_axe",
    "minecraft:golden_axe",
    "minecraft:iron_axe",
    "minecraft:diamond_axe",
    "minecraft:netherite_axe",
    "minecraft:wooden_hoe",                 # HoeItem
    "minecraft:stone_hoe",
    "minecraft:golden_hoe",
    "minecraft:iron_hoe",
    "minecraft:diamond_hoe",
    "minecraft:netherite_hoe",
    "minecraft:wooden_pickaxe",             # PickaxeItem
    "minecraft:stone_pickaxe",
    "minecraft:golden_pickaxe",
    "minecraft:iron_pickaxe",
    "minecraft:diamond_pickaxe",
    "minecraft:netherite_pickaxe",
    "minecraft:wooden_shovel",             # ShovelItem
    "minecraft:stone_shovel",
    "minecraft:golden_shovel",
    "minecraft:iron_shovel",
    "minecraft:diamond_shovel",
    "minecraft:netherite_shovel"
    "minecraft:turtle_helmet",              # ArmorItem
    "minecraft:leather_helmet",
    "minecraft:leather_chestplate",
    "minecraft:leather_leggings",
    "minecraft:leather_boots",
    "minecraft:chainmail_helmet",
    "minecraft:chainmail_chestplate",
    "minecraft:chainmail_leggings",
    "minecraft:chainmail_boots",
    "minecraft:iron_helmet",
    "minecraft:iron_chestplate",
    "minecraft:iron_leggings",
    "minecraft:iron_boots",
    "minecraft:diamond_helmet",
    "minecraft:diamond_chestplate",
    "minecraft:diamond_leggings",
    "minecraft:diamond_boots",
    "minecraft:golden_helmet",
    "minecraft:golden_chestplate",
    "minecraft:golden_leggings",
    "minecraft:golden_boots",
    "minecraft:netherite_helmet",
    "minecraft:netherite_chestplate",
    "minecraft:netherite_leggings",
    "minecraft:netherite_boots"
]

## DO NOT CHANGE ORDER OF THIS LIST
stackable_16 = [
    "minecraft:oak_sign",
    "minecraft:spruce_sign",
    "minecraft:birch_sign",
    "minecraft:jungle_sign",
    "minecraft:acacia_sign",
    "minecraft:dark_oak_sign",
    "minecraft:mangrove_sign",
    "minecraft:crimson_sign",
    "minecraft:warped_sign"
    "minecraft:bucket",
    "minecraft:snowball",
    "minecraft:egg",
    "minecraft:ender_pearl",
    "minecraft:written_book",
    "minecraft:armor_stand",
    "minecraft:white_banner",
    "minecraft:white_banner",
    "minecraft:orange_banner",
    "minecraft:magenta_banner",
    "minecraft:light_blue_banner",
    "minecraft:yellow_banner",
    "minecraft:lime_banner",
    "minecraft:pink_banner",
    "minecraft:gray_banner",
    "minecraft:light_gray_banner",
    "minecraft:cyan_banner",
    "minecraft:purple_banner",
    "minecraft:blue_banner",
    "minecraft:brown_banner",
    "minecraft:green_banner",
    "minecraft:red_banner",
    "minecraft:black_banner",
    "minecraft:honey_bottle"
]


@dataclass
class RecipeResult:
    name: str
    count: int = 1
    rolls: int = 1


@dataclass
class RecipeShape:
    ingredients: list[str]
    result: list[RecipeResult]
    shapeless: bool
    mirror: bool = False


@dataclass
class RecipeData:
    name: str
    recipe: RecipeShape
    slot_count: int
    total_length: int

    def copy(self):
        return RecipeData(self.name, self.recipe, self.slot_count, self.total_length)


@dataclass
class TagData:
    name: str
    values: list[Any]


def beet_default(ctx: Context):
    vanilla = ctx.inject(Vanilla)

    recipes: list[RecipeData] = []

    for id, recipe in vanilla.data.recipes.items():
        name = id.split(':')[1]
        contents = recipe.data
        if contents["type"] == "minecraft:crafting_shaped":
            recipe = analyze_shaped_recipe(ctx, contents, name)
        elif contents["type"] == "minecraft:crafting_shapeless":
            recipe = analyze_shapeless_recipe(ctx, contents, name)
        else:
            continue

        # create loot table file for recipe output
        generate_crafting_loot_table(ctx, recipe.result, name)

        # gets the two parameters (slot_count and total_length) used for the search tree
        all_items = [i for i in recipe.ingredients if i != "minecraft:air"]
        has_tag = "#" in "".join(all_items)
        total_length = -1 if has_tag else sum([len(i) for i in all_items])

        recipes.append(RecipeData(name, recipe, len(all_items), total_length))

    # create the search tree functions
    generate_trees(ctx, recipes)


def analyze_shaped_recipe(ctx: Context, recipe: dict[str, Any], name: str) -> RecipeShape:
    """
    analyzes the contents of the shaped recipe json
    """
    pattern: list[str] = []
    result: list[RecipeResult] = []
    list_symbols: list[str] = []

    while len(recipe["pattern"]) < 3:
        recipe["pattern"].append("   ")
    # convert pattern to array with items
    for row in recipe["pattern"]:
        pattern_row: list[str] = []
        row = row.ljust(3)

        # check each ingredient
        for symbol in row:
            if symbol == " ":
                item = "minecraft:air"
            else:
                ingredient: Any = recipe["key"][symbol]
                if isinstance(ingredient, list):
                    if symbol not in list_symbols:
                        generate_custom_item_tag(ctx, TagData(f"#{NAMESPACE}:{name}_ingredient_{len(list_symbols) + 1}", ingredient)) #type: ignore
                        list_symbols.append(symbol)
                    item = f"#{NAMESPACE}:{name}_ingredient_{list_symbols.index(symbol) + 1}"
                elif "item" in ingredient:
                    item = ingredient["item"]
                else:
                    item = "#" + ingredient["tag"]
            pattern_row.append(item)

            def add_result(item: str):
                if len(result) and result[-1].name == item:
                    result[-1].rolls += 1
                else:
                    result.append(RecipeResult(item))
            if item in buckets:
                add_result("minecraft:bucket")
            elif item in bottles:
                add_result("minecraft:glass_bottle")
            else:
                add_result("minecraft:air")

        # add the input row to the pattern list
        pattern.extend(pattern_row)

    # left align the pattern
    while pattern[0] == "minecraft:air" and pattern[3] == "minecraft:air" and pattern[6] == "minecraft:air":
        pattern[0] = pattern[1]
        pattern[1] = pattern[2]
        pattern[2] = "minecraft:air"
        pattern[3] = pattern[4]
        pattern[4] = pattern[5]
        pattern[5] = "minecraft:air"
        pattern[6] = pattern[7]
        pattern[7] = pattern[8]
        pattern[8] = "minecraft:air"
    # top align the pattern
    while pattern[0] == "minecraft:air" and pattern[1] == "minecraft:air" and pattern[2] == "minecraft:air":
        pattern[0] = pattern[3]
        pattern[1] = pattern[4]
        pattern[2] = pattern[5]
        pattern[3] = pattern[6]
        pattern[4] = pattern[7]
        pattern[5] = pattern[8]
        pattern[6] = "minecraft:air"
        pattern[7] = "minecraft:air"
        pattern[8] = "minecraft:air"


    # mark mirror-able recipes
    mirror = False
    if (pattern[2] == "minecraft:air" and pattern[5] == "minecraft:air" and pattern[8] == "minecraft:air"):
        if (pattern[0] != pattern[1] != "minecraft:air" or pattern[3] != pattern[4] != "minecraft:air" or pattern[6] != pattern[7] != "minecraft:air"):
            mirror = True
    elif (pattern[0] != pattern[2] or pattern[3] != pattern[5] or pattern[6] != pattern[8]):
        mirror = True

    # get what the last output item was
    last_output = result[-1].name
    # remove the last output item from result
    result[-1].rolls -= 1
    if result[-1].rolls == 0:
        result.pop()
    # if last output item was not air, move it somewhere else
    if last_output != "minecraft:air":
        found_match = False
        # check if the last item is the same as another item in the output loot table
        for i, r in enumerate(result):
            # if a matching item is found, merge them
            if r.name == last_output:
                # if there's only one instance, just increase the count
                if r.rolls == 1:
                    r.count += 1
                # if there's multiple instances, increase the count for only one of the rolls
                else:
                    r.rolls -= 1
                    result.insert(i, RecipeResult(r.name, count=2))
                found_match = True
                break
        # if there's no matching item in the output loot table, put the item in the first empty output slot
        if not found_match:
            for i, r in enumerate(result):
                # find the first instance of an air roll
                if r.name == "minecraft:air":
                    # decrease the number of air rolls, and add a roll for the last output item before that
                    r.rolls -= 1
                    result.insert(i, RecipeResult(last_output))
                    found_match = True
                    break
            # if the entire thing is full, just print the recipe for manual correction
            # if it gets here the last bottle/bucket will be voided
            if not found_match:
                print("FULL: " + recipe["result"]["item"] + " -> " + last_output)

    # set the last slot to the recipe result
    result_id = recipe["result"]["item"]
    result_count = recipe["result"].get("count", 1)
    result.append(RecipeResult(result_id, count=result_count))
    # return the new formatted recipe
    return RecipeShape(pattern, result, shapeless=False, mirror=mirror)



def analyze_shapeless_recipe(ctx: Context, recipe: dict[str, Any], name: str) -> RecipeShape:
    """
    analyzes the contents of the shapeless recipe json
    """
    tag_count = 0
    ingredients: list[str] = []
    result: list[RecipeResult] = []
    bucket_count = 0
    bottle_count = 0
    for entry in recipe["ingredients"]:
        if isinstance(entry, list):
            tag_count += 1
            item = f"#{NAMESPACE}:{name}_ingredient_{tag_count}"
            generate_custom_item_tag(ctx, TagData(item, entry)) # type: ignore
        elif "item" in entry:
            item = entry["item"]
            # special case: check if the item is a bucket or bottle type (used for output)
            if item in buckets:
                bucket_count += 1
            elif item in bottles:
                bottle_count += 1
        else:
            item = "#" + entry["tag"]
        ingredients.append(item)

    # if there were (non-empty) buckets in the recipe, return empty buckets
    if bucket_count > 0:
        result.append(RecipeResult("minecraft:bucket", count=bucket_count))
    # if there were (non-empty) bottles in the recipe, return empty bottles
    if bottle_count > 0:
        result.append(RecipeResult("minecraft:glass_bottle", count=bottle_count))
    # fill the slots with air, up until the last slot
    air_count = 8 - bucket_count - bottle_count
    result.append(RecipeResult("minecraft:air", rolls=air_count))
    # set the last slot to the recipe result
    result_id = recipe["result"]["item"]
    result_count = recipe["result"].get("count", 1)
    result.append(RecipeResult(result_id, count=result_count))
    # return the new formatted recipe
    return RecipeShape(ingredients, result, shapeless=True)



def generate_custom_item_tag(ctx: Context, data: TagData) -> str:
    """
    creates a custom item tag for a list of items
    """
    # get prefix and name of item tag
    name = data.name.removeprefix(f"#{NAMESPACE}:")
    json: Any = {"values": []}
    # move values to the json
    for value in data.values:
        # if there's a nested list, combine them into a single values list
        # (just a failsafe; this makes no sense, but neither does Mojang)
        if type(value) is list[Any]:
            for item in value:
                if "item" in item:
                    # if it's an item, just append the item
                    json["values"].append(item["item"])
                elif "tag" in item:
                    # if it's an (actual) item tag, add '#' before the value
                    json["values"].append("#" + item["tag"])
        else:
            if "item" in value:
                # if it's an item, just append the item
                json["values"].append(value["item"])
            elif "tag" in value:
                # if it's an (actual) item tag, add '#' before the value
                json["values"].append("#" + value["tag"])
    # create item tag file
    ctx.data[f"{NAMESPACE}:{name}"] = ItemTag(json)

    # write the function that checks the predicates
    fn_name = f"{NAMESPACE}:check_item_tags"
    if fn_name not in ctx.data.functions:
        ctx.data.functions[fn_name] = Function([
            "# checks each slot for item tags",
            "# @s = crafter armor stand\n# located at the center of the block",
            "# run from gm4_custom_crafters-3.0:process_input/check_item_tags via #gm4_custom_crafters:custom_item_checks",
            "",
        ])
    ctx.data.functions[fn_name].append(f"execute if predicate {NAMESPACE}:custom_item_tags/{name} run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.{NAMESPACE}.{name} set value 1b")

    # create predicate file for the item tag check
    json: Any = {"condition":"minecraft:entity_properties","entity":"this","predicate":{"equipment":{"mainhand":{"tag": f"{NAMESPACE}:{name}"}}}}
    ctx.data[f"{NAMESPACE}:custom_item_tags/{name}"] = Predicate(json)

    # return the name of the item tag just created
    return data.name[1:]



def generate_crafting_loot_table(ctx: Context, result: list[RecipeResult], target: str):
    """
    creates a loot table for the output result of the custom crafting recipe
    """
    # create initial loot table
    json: Any = {"type": "minecraft:generic","pools": []}
    for r in result:
        # populate pools
        pool: Any = {"rolls":r.rolls,"entries":[{"type":"minecraft:item","name":r.name}]}
        # set count
        if r.count > 1:
            pool["entries"][0]["functions"] = [{"function":"minecraft:set_count","count":r.count}]
        json["pools"].append(pool)

    # write loot table file
    ctx.data[f"{NAMESPACE}:{LOOT_PATH}/{target}"] = LootTable(json)



def generate_trees(ctx: Context, recipes: list[RecipeData]) -> None:
    """
    generates the search tree functions
    """
    # separate recipes list into lists of same slot_count, sorted by total_length
    recipes_by_slot_count = {
        k: sorted([r for r in recipes if r.slot_count == k], key=lambda d: d.total_length)
        for k in range(1, 10)
    }

    def on_slot_leaf(value: int, path: str):
        recipes = recipes_by_slot_count[value]

        # turn recipes list into dict w/ total_length as key
        recipes_by_total_length = {
            k: list(g)
            for k, g in groupby(recipes, key=lambda r: r.total_length)
            if k != -1
        }
        recipes_using_tags = [r for r in recipes if r.total_length == -1]

        # get the maximum length, this works because recipes was sorted by total_length
        max_length = max(0, recipes[-1].total_length)

        def on_length_leaf(value: int, path: str):
            generate_recipe_function(ctx, recipes_by_total_length[value], path)

        # create a search tree based on the total length
        generate_search_tree(ctx, dict(recipes_by_total_length), 0, max_length, path, "$id_total gm4_crafting", on_length_leaf)

        # if this slot_count has recipes that use tags, then create a function that doesn't check total_length
        if recipes_using_tags:
            path_uses_tags = f"{path}/uses_tags"
            ctx.data.functions[f"{NAMESPACE}:{path}/search"].append(f"execute if score $crafted gm4_crafting matches 0 run function {NAMESPACE}:{path_uses_tags}")
            generate_recipe_function(ctx, recipes_using_tags, path_uses_tags)

    # create a search tree based on the slot_count
    generate_search_tree(ctx, recipes_by_slot_count, 0, 9, BRANCH_PATH, "$slot_count gm4_crafting", on_slot_leaf, "/search")



def generate_search_tree(ctx: Context, entries: dict[int, list[RecipeData]], start: int, end: int, path: str, score: str, on_leaf: Callable[[int, str], None], leaf_suffix: str = ""):
    completed: set[int] = set()

    def in_range(low: int, high: int):
        """
        returns the indices of entries between low and high
        """
        return [i for i in range(low, high + 1) if i in entries]

    def create_leaves(low: int, high: int, path: str, fn: Function):
        """
        creates the leaves for entries between low and high need a function
        """
        # for all entries between low and high
        for i in in_range(low, high):
            # only generate if that slot_count exists and doesn't yet have a function
            if i in completed:
                continue
            # add i to list of completed functions
            completed.add(i)
            # write function file for this slot_count
            leaf_path = f"{path}/{i}"
            fn.append(f"execute if score $crafted gm4_crafting matches 0 if score {score} matches {i} run function {NAMESPACE}:{leaf_path}{leaf_suffix}")
            # call any specific leaf function
            on_leaf(i, leaf_path)

    def find_middle(low: int, high: int) -> int:
        """
        get weighted middle between min and max
        """
        # count the total number of values between min and max
        total = sum([len(entries[i]) for i in range(low, high) if i in entries])
        # get halfway point
        target = total // 2
        i = low
        count = 0
        # count the number of values until halfway is reached
        while i < high and count < target:
            if i in entries:
                count += len(entries[i])
            i += 1
        return i

    def update_range(low: int, high: int) -> tuple[int, int]:
        """
        move low and high to values that exist in dict
        """
        if low < high:
            low = min([i for i in entries if i >= low])
            high = max([i for i in entries if i <= high])
        return low, high

    def branch(start: int, end: int, path: str, fn: Function):
        """
        creates two branches of the search tree
        """
        # get halfway point
        half = find_middle(start, end)
        
        # get first half
        low, high = update_range(start, half - 1)
        # if count(high - low) <= 1
        if len(in_range(low, high)) <= 1:
            # create functions for the values between low and high
            create_leaves(low, high, path, fn)
        else:
            # branch again
            new_path = f"{path}/{low}_{high}"
            fn.append(f"execute if score $crafted gm4_crafting matches 0 if score {score} matches {low}..{high} run function {NAMESPACE}:{new_path}/search")
            generate_tree(low, high, new_path)

        # get second half
        low, high = update_range(half, end)
        # if count(high - low) <= 1
        if len(in_range(low, high)) <= 1:
            # create functions for the values between low and high
            create_leaves(low, high, path, fn)
        else:
            # branch again
            new_path = f"{path}/{low}_{high}"
            fn.append(f"execute if score $crafted gm4_crafting matches 0 if score {score} matches {low}..{high} run function {NAMESPACE}:{new_path}/search")
            generate_tree(low, high, new_path)

    def generate_tree(start: int, end: int, path: str):
        fn = Function()

        if len(in_range(start, end)) <= 4:
            create_leaves(start, end, path, fn)
        else:
            # get halfway point
            half = find_middle(start, end)

            # branch the first half into two branches
            low, high = update_range(start, half - 1)
            branch(low, high, path, fn)

            # branch the second half into two branches
            low, high = update_range(half, end)
            branch(low, high, path, fn)

        ctx.data[f"{NAMESPACE}:{path}/search"] = fn

    generate_tree(start, end, path)



def generate_recipe_function(ctx: Context, recipes: list[RecipeData], path: str) -> None:
    """
    create recipe function for the specific slot_count and total_length
    """
    def stack_size(recipe: RecipeShape) -> str:
        """
        get max stack size of items based on result stackability and count
        """
        result = recipe.result[-1]
        item = result.name
        count = result.count
        # stack_size should be less than or equal to stack_count // result_count
        if item in unstackables:
            return "1"
        elif item in stackable_16:
            return f"..{16 // count}"
        else:
            return f"..{64 // count}"

    fn = Function()

    for r in recipes:
        recipe = r.recipe
        # get max stack size for recipe
        max_stack = stack_size(recipe)
        name = r.name
        # set initial checks
        checks = f"if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $stack_size gm4_crafting matches {max_stack}"
        
        items: list[str] = []
        recipe_data = ""
        # if shapeless recipe
        if recipe.shapeless:
            duplicates: list[Any] = []
            counted: list[Any] = []
            for item in recipe.ingredients:
                # check for duplicates in recipe
                if recipe.ingredients.count(item) > 1:
                    # add each duplicate items to a list with the number of duplicates
                    if item not in counted:
                        counted.append(item)
                        duplicates.append({"item": item, "count": recipe.ingredients.count(item)})
                else:
                    # check if it's an item tag or a normal item
                    if "#" in item:
                        item = item[1:]
                        [prefix, tag] = item.split(":")
                        # construct special nbt for checking item tags
                        s = "{item_tags:{" + prefix + ":{" + tag + ":1b}}}"
                        items.append(s)
                    else:
                        # construct nbt for checking item id
                        s = "{id:\"" + item + "\"}"
                        items.append(s)
            # if there are duplicates in the recipe, add some commands to check the count of slots with that item
            if len(duplicates) > 0:
                # reset scoreboard in case a previous function checked the same items
                fn.append("scoreboard players reset * gm4_craft_shapeless")
                # modify the checks to not do 'store result score $crafted gm4_crafting'; must be moved to end
                checks = f"if score $crafted gm4_crafting matches 0 if score $stack_size gm4_crafting matches {max_stack}"
                # for each type of duplicate item, check the count
                while len(duplicates) > 0:
                    # get the item and number of required slots
                    item = duplicates[0]["item"]
                    count = duplicates[0]["count"]
                    # check if it's an item tag or normal item
                    if "#" in item:
                        item = item[1:]
                        [prefix, tag] = item.split(":")
                        # construct special nbt for checking item tags
                        s = "{item_tags:{" + prefix + ":{" + tag + ":1b}}}"
                        item = "#" + item
                    else:
                        # construct nbt for checking item id
                        s = "{id:\"" + item + "\"}"
                    # write command to check item count
                    command = f"execute {checks} store result score ${item} gm4_craft_shapeless if data storage gm4_custom_crafters:temp/crafter Items[" + s + "]"
                    checks = f"if score ${item} gm4_craft_shapeless matches {count}"
                    fn.append(command)
                    duplicates.pop(0)
                # re-add the 'store result score...' to end of the checks
                checks = f"{checks} store result score $crafted gm4_crafting"

        # if shaped recipe
        else:
            # keep track of the slot number
            i = 0
            for item in recipe.ingredients:
                if "#" in item:
                    item = item[1:]
                    [prefix, tag] = item.split(":")
                    # construct special nbt for checking item tags
                    s = "{Slot:" + str(i) + "b,item_tags:{" + prefix + ":{" + tag + ":1b}}}"
                    items.append(s)
                elif item != "minecraft:air":
                    # construct nbt for checking item id
                    s = "{Slot:" + str(i) + "b,id:\"" + item + "\"}"
                    items.append(s)
                i += 1
            # if mirrorable
            if recipe.mirror:
                # mirror recipe
                pattern: Any = recipe.ingredients
                # if 2 columns
                if (pattern[2] == "minecraft:air" and (len(pattern) < 6 or pattern[5] == "minecraft:air") and (len(pattern) < 9 or pattern[8] == "minecraft:air")):
                    # flip columns 1 and 2
                    if (len(pattern) >= 3):
                        if (pattern[2] == "minecraft:air"):
                            temp = pattern[0]
                            pattern[0] = pattern[1]
                            pattern[1] = temp
                        else:
                            temp = pattern[0]
                            pattern[0] = pattern[2]
                            pattern[2] = temp
                    if (len(pattern) >= 6):
                        temp = pattern[3]
                        pattern[3] = pattern[4]
                        pattern[4] = temp
                    if (len(pattern) == 9):
                        temp = pattern[6]
                        pattern[6] = pattern[7]
                        pattern[7] = temp
                # if 3 columns
                else:
                    # flip columsn 1 and 3
                    if (len(pattern) >= 3):
                        temp = pattern[0]
                        pattern[0] = pattern[2]
                        pattern[2] = temp
                    if (len(pattern) >= 6):
                        temp = pattern[3]
                        pattern[3] = pattern[5]
                        pattern[5] = temp
                    if (len(pattern) == 9):
                        temp = pattern[6]
                        pattern[6] = pattern[8]
                        pattern[8] = temp
                # add mirrored recipe
                new_recipe = r.copy()
                # the copy is only shallow so changing mirror also modifies the old recipe,
                # but this is not a problem since the old recipe is already processed and
                # we are adding to the end of the list
                new_recipe.recipe.mirror = False
                recipes.append(new_recipe)

        # add final item check (used for shapeless recipes with both duplicate items and non-duplicate items)
        if len(items) != 0:
            recipe_data += "if data storage gm4_custom_crafters:temp/crafter {Items:[" + ",".join(items) + "]} "

        # write final command to check if recipe is valid
        fn.append(f"execute {checks} {recipe_data}run loot replace block ~ ~ ~ container.0 loot {NAMESPACE}:{LOOT_PATH}/{name}")

    ctx.data[f"{NAMESPACE}:{path}"] = fn
