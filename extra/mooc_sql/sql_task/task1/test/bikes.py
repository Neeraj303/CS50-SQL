import sqlite3

db = sqlite3.connect('bikes.db')
db.isolation_level=None

def distance_of_user(user):
    '''
    Reports the total distance traveled by the user. (2 points)
    '''
    sql_query = '''
        SELECT SUM(t.distance)
        FROM trips t
        JOIN users u ON t.user_id = u.id
        WHERE u.name = ?
        '''
    result = db.execute(sql_query, [user]).fetchone()
    return result[0]

def speed_of_user(user):
    '''
    Reports the user's average speed (km/h) over all trips to two 
    decimal places. (2 points)
    '''
    sql_query = '''
        SELECT ROUND((SUM(t.distance)*60.0) / (SUM(t.duration)*1000), 2)  --since time in minutes
        FROM trips t
        JOIN users AS u ON t.user_id = u.id
        GROUP BY u.name
        HAVING u.name = ?
        '''
    result = db.execute(sql_query, [user]).fetchone()
    return result[0]

    
def duration_in_each_city(day):
    '''
    Report for each city how long people cycled on a given day. (3 points)
    '''
    sql_query = '''
        SELECT c.name, SUM(t.duration)
        FROM trips t
        JOIN stops s ON t.from_id = s.id
        JOIN cities c ON s.city_id = c.id
        WHERE t.day = ?
        GROUP BY c.name
        ORDER BY c.name 
        '''
    result = db.execute(sql_query, [day]).fetchall()
    return result

def users_in_city(city):
    '''
    indicates how many different users have been on bikes in a 
    given city. (2 points)
    '''
    sql_query = '''
        SELECT COUNT(DISTINCT t.user_id)
        FROM trips t
        JOIN stops s ON t.from_id = s.id
        JOIN cities c ON s.city_id = c.id
        WHERE c.name = ?
        '''
    result = db.execute(sql_query, [city]).fetchone()
    return result[0]


def trips_on_each_day(city):
    '''
    For each day, state how many trips have been made on that day.
    (3 points)
    '''
    sql_query = '''
        SELECT t.day, COUNT(DISTINCT t.id)
        FROM trips t
        JOIN stops s ON t.from_id = s.id
        JOIN cities c ON s.city_id = c.id
        WHERE c.name = ?
        GROUP BY t.day
        ORDER BY t.day
        '''
    result = db.execute(sql_query, [city]).fetchall()
    return result


def most_popular_start(city):
    '''
    Indicates the most popular starting point in the city for the
    trip and the number of trips (if there are several options, the
    last one in alphabetical order is chosen). (3 points)
    '''
    sql_query = '''
        SELECT s.name, COUNT(t.id)
        FROM trips t
        JOIN stops s ON t.from_id = s.id
        JOIN cities c ON s.city_id = c.id
        WHERE c.name = ?
        GROUP BY s.name
        ORDER BY COUNT(t.id) DESC, s.name DESC
        LIMIT 1
        '''
    result = db.execute(sql_query, [city]).fetchone()
    return result
    