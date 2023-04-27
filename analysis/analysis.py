import os
import pandas as pd
import psycopg2 as pg
from faker import Faker
import matplotlib.pyplot as plt

if __name__ == '__main__':
    conn = pg.connect(
        dbname="postgres", 
        user="postgres", 
        password="postgres", 
        host="127.0.0.1", 
        port="5432"
    )

    cursor = conn.cursor()
    faker = Faker()

    for k in range(0):
        n = faker.name().split(' ')
        surname = n[1]
        name = n[0]
        date = faker.date()
        country = faker.country()
        cursor.execute("""
        INSERT INTO Medialibrary.Actors (first_name, last_name, birth_day, country) 
            VALUES ('{}', '{}', '{}', '{}')""".format(name, surname, date, country)
        )

    conn.commit()

    """График количества актёров по стране"""
    columns=["country", "actors_number"]
    df = pd.DataFrame(columns=columns)
    cursor.execute(f"SELECT country, COUNT(actor_id) AS actors_number FROM Medialibrary.Actors GROUP BY country ORDER BY country")
    rows = cursor.fetchall()
    for row in rows:
        df = pd.concat(
            [df, pd.DataFrame.from_dict(dict(zip(columns, list(map(lambda x: [x], row)))))],
            ignore_index=True
        )
    p = df.plot.bar(x='country', y='actors_number')
    p.set_xlabel('Country')
    p.set_ylabel('Count')
    
    plt.show()
