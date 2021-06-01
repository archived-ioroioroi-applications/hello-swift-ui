""" database.py """
import json
from jsonpath import jsonpath
from mongoengine import connect
import os

from models import Enemy, Level, Game, Powerup

DATABASE = os.environ.get("MONGO_DATABASE")
HOST = os.environ.get("MONGO_HOST")
USER = os.environ.get("MONGO_USER")
PASSWORD = os.environ.get("MONGO_PASSWORD")


client = connect(
    db=DATABASE,
    username=USER,
    password=PASSWORD,
    host=HOST
)

# client.drop_database(DATABASE) # バグかなんか知らんが上でconnectしたときの認証情報使ってくれずエラーになるので, 一旦コメントアウト. dropするときは/mongo/data配下全消しがワークアラウンドになる.

def init_db():

    with open("smb.json", "r") as file:
        data = json.loads(file.read())
    game = Game(name=data[0].get("table_data").get("Game"))
    game.save()

    for row in data:
        enemies = []
        for elem in row["enemies"]:
            amount = elem["amount"] if isinstance(elem["amount"], int) else 1
            enemy = Enemy(name=elem["name"], amount=amount)
            enemy.save()
            enemies.append(enemy)

        powerups = []
        for elem in row["statistics"]:
            powerup = Powerup(name=elem["name"], amount=elem["amount"])
            powerup.save()
            powerups.append(powerup)

        level = Level(
            description=row.get("description"),
            name=jsonpath(row, "table_data.World-Level")[0],
            world=jsonpath(row, "table_data.World")[0],
            time_limit=jsonpath(row, "table_data.Time limit")[0].split(" ")[0],
            boss=row.get("table_data").get("Boss"),
            enemies=enemies,
            game=game,
            powerups=powerups,
        )

        level.save()


init_db()
