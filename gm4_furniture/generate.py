from beet import Context, subproject
from typing import List, Dict, Any
from pathlib import Path
import csv

class CSVRow():
    """
    Read-only dict wrapper which represents a row of data from a .csv file.
    """

    def __init__(self, column_names: List[str] | None = None, data: List[str] | None = None) -> None:
        """
        Initialize a new CSVRow object using the supplied column names and data. CSVRow objects are read-only by design.
        If no data and no column names are supplied the resulting CSVRow object will evaluate to false in boolean expressions.

        Access data within this CSVRow via the `get(key, default)` method or using `[<key: str>]`.
        """
        if not column_names:
            column_names = []
        if not data:
            data = []

        if len(column_names) != len(data):
            raise ValueError(
                f"Could not build CSVRow from supplied column names and data; Number of supplied column names ({len(column_names)}) does not match number of supplied data entries ({len(data)}).")

        self._data = {column_names[column_index]: value for column_index, value in enumerate(data)}

    def __bool__(self):
        """
        Allow for the use of CSVRow instances in if statements; If the CSVRow has no keys it is equivalent to `False`.
        """
        return len(self._data.keys()) != 0

    def __getitem__(self, key: str):
        try:
            return self._data[key]
        except KeyError as ke:
            raise ValueError(
                f"Failed to select column named '{ke.args[0]}' from CSVRow with columns {[key for key in self._data]}.")

    def __repr__(self) -> str:
        return str(self._data)

    def get(self, key: str, default: str | Any) -> str:
        """
        Returns the value corrosponding to the key if it exists and is not the empty string.
        Else returns the provided default. The provided default is cast to a string internally.
        """
        value = self._data.get(key, str(default))
        if value:
            return value
        else:
            return str(default)


class CSV():
    """
    List-of-Rows representation of a .csv file which can be iteraded over using for ... in.
    Optimized for row-first access, i.e. select a row, then a column.
    Also provides a `find_row` function for column-first, i.e. select a column, then a row, access.
    However, the latter is is more expensive.

    All access methods return CSVRow objects which are dynamically created upon calling an access method.
    """

    def __init__(self, column_names: List[str], rows: List[List[str]]) -> None:
        """
        Initialize a new CSV from a list of column names (headers) and a list of rows.
        The latter contain actual data, whilst the former only holds names of columns.
        """
        self._column_names = column_names
        self._rows = rows

    def __iter__(self):
        self.__current = 0
        self.__last = len(self._rows)
        return self

    def __next__(self) -> CSVRow:
        current = self.__current
        self.__current += 1
        if current < self.__last:
            return CSVRow(self._column_names, self._rows[current])
        raise StopIteration()

    def __getitem__(self, row_index: int):
        return CSVRow(self._column_names, self._rows[row_index])

    def __repr__(self):
        return str([CSVRow(self._column_names, data) for data in self._rows])

    def find_row(self, value: str, by_column: str | int = 0) -> CSVRow:
        """
        Finds and returns the first row in this CSV which has `value` in column `by_column`. `by_column` can either be a str, in which case it is treated
        as a column name and the header line is searched for a matching string, or an int n, in which case the nth column is selected.
        `by_column` defaults to `0`.
        Returns an empty `CSVRow` if no match was found.
        """
        if isinstance(by_column, str):
            by_column = self._column_names.index(by_column)

        for row in self._rows:
            if row[by_column] == value:
                return CSVRow(self._column_names, row)
        return CSVRow()

def read_csv(path: Path) -> CSV:
    """
    Reads in a csv file and returns a list of rows. Each row consists of a dictionary which contains labeled values.
    """
    with open(path, mode='r') as file:
        csv_file = csv.reader(file)
        header = next(csv_file)

        return CSV(column_names=header, rows=[[str(cell) for cell in row] for row in csv_file])

def beet_default(ctx: Context):

    trades_init = []
    trades_list = []
    trades_append = []

    furniture_sets = {}

    for path in sorted(Path('gm4_furniture/raw_data/furniture_set').glob('*.csv')):
        furniture_sets[path.stem] = read_csv(path)

    tool_cmds = read_csv(Path('gm4_furniture/raw_data/tool_cmds.csv'))

    # loop through the different sheets, each sheet hold a different 'set_name'
    # of furniture which need to be sorted in the furniture_station storage
    for set_name,furniture_set in furniture_sets.items():

        # read trade data from this sheet, this creates the villager trades used
        # inside the furniture station
        tool_cmd = tool_cmds.find_row(set_name , 0)['tool_cmd']

        # call generate_trade_data to build the commands
        new_trades_init,new_trades_list,new_trades_append = generate_trade_data(furniture_set, tool_cmd, set_name)
        # append the trade data to the total list
        trades_init.append(new_trades_init)
        trades_list.append(new_trades_list)
        trades_append.append(new_trades_append)

        # read furniture data from this sheet, and then create the placement function
        # and loot table for each furniture
        generate_furniture_data(ctx, furniture_set, set_name)


    # build the trade data commands
    trades_init = '\n'.join(trades_init)
    trades_list = '\n'.join(trades_list)
    trades_append = '\n'.join(trades_append)
    # build the trade data function from crafting_template
    subproject_config = {
        "data_pack": {
            "load": [
                {
                    f"data/gm4_furniture/functions/generate_trades.mcfunction": "data/gm4_furniture/templates/functions/crafting_template.mcfunction",
                }
            ],
            "render": {
                "functions": "*"
            }
        },
        "meta": {
            "trades_init": trades_init,
            "trades_list": trades_list,
            "trades_append": trades_append,
        }
    }

    ctx.require(subproject(subproject_config))



def generate_trade_data(furniture_set, tool_cmd, set_name):

    # create a command to make an empty storage called new_trades that holds the set_name name and tool cmd
    new_trades_init = "data modify storage gm4_furniture:temp new_trades." + set_name + " set value {cmd:" + tool_cmd + ",trades:[]}"

    # iterate over the rows in the spreadsheet and add the trade data for each furniture to the storage
    new_trades_list = []
    for row in furniture_set:
        new_trades_list.append("data modify storage gm4_furniture:temp new_trades." + set_name + ".trades append value {cost:[{id:" + row['craft_item_1_id'] + ",Count:" + row['craft_item_1_count'] + "b},{id:" + row['craft_item_2_id'] + ",Count:" + row['craft_item_2_count'] + "b}],result:{furniture_id:\"" + set_name + "/" + row['technical_id'] + "\",Count:" + row['craft_result_count'] + "}}")
    new_trades_list = '\n'.join(new_trades_list)

    # add command to append the main furniture_station storage with the newly created new_trades
    new_trades_append = "data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades." + set_name

    # return the created commands
    return(new_trades_init,new_trades_list,new_trades_append)



def generate_furniture_data(ctx, furniture_set, set_name):

    # create furniture loot tables and placement functions for every furniture in this category
    for row in furniture_set:
        # build placement function and loot table for furniture piece
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_furniture/loot_tables/furniture/{set_name}/{row['technical_id']}.json": "data/gm4_furniture/templates/loot_tables/furniture_item_template.json",
                        f"data/gm4_furniture/functions/place/furniture/{set_name}/{row['technical_id']}.mcfunction": "data/gm4_furniture/templates/functions/furniture_place_template.mcfunction",
                    }
                ],
                "render": {
                    "loot_tables": "*",
                    "functions": "*"
                }
            },
            "meta": {
                "category": set_name,
                "technical_id": row['technical_id'],
                "display_name": row['display_name'],
                "cmd": row['cmd'],
                "block_id": row['block_id'],
                "sittable": row['sittable'],
                "wall_only": str(int(row['wall_only'] == 'TRUE')),
                "ceiling_only": str(int(row['ceiling_only'] == 'TRUE')),
                "dyable": str(int(row['dyable'] == 'TRUE')),
                "length": row['length'],
                "depth": row['depth'],
                "height": row['height'],
                "table": str(int(row['table'] == 'TRUE')),
                "scale": row['scale'],
                "allow_diagonal_placement": str(int(row['diag'] == 'TRUE')),
                "custom_interaction": str(int(row['custom'] == 'TRUE'))
            }
        }

        ctx.require(subproject(subproject_config))
