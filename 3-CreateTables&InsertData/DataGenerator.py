import mysql
import mysql.connector
from faker import Faker
import random
from barnum import gen_data

myDB = mysql.connector.connect(
    host='localhost',
    user='root',
    database='onlineshopdigikala'
)

myCursor = myDB.cursor()
fake = Faker()


def timestamp_generator(farDate=False):
    fake = Faker()
    if farDate:
        return fake.date_time_between(start_date='now', end_date='+10y').strftime("%Y-%m-%d %H:%M:%S")
    else:
        return fake.date_time_between(start_date='-30y', end_date='now').strftime("%Y-%m-%d %H:%M:%S")


def fake_phone_number():
    phone_number = '09'
    for _ in range(9):
        phone_number += str(random.randint(0, 9))
    return phone_number


def generate_data_customer():
    sql_insert = "INSERT INTO customer(name, phone_number, address, created_at) VALUES(%s, %s, %s, %s)"
    values = []
    for _ in range(150):
        name = fake.first_name() + fake.last_name()
        phone_number = fake_phone_number()
        address = fake.address()
        created_at = timestamp_generator()
        values.append((name, phone_number, address, created_at))

    myCursor.executemany(sql_insert, values)


def generate_data_shop():
    sql_insert = "INSERT INTO Shop(name, address, supervisor_name, created_at, phone_number, independent) VALUEs (%s, %s, %s, %s, %s, %s)"
    values = []
    for _ in range(100):
        name = gen_data.create_company_name()
        address = fake.address()
        supervisor_name = fake.first_name() + fake.last_name()
        created_at = timestamp_generator()
        phone_number = gen_data.create_phone()
        independent = random.randint(0, 1)
        values.append((name, address, supervisor_name, created_at, phone_number, independent))

    myCursor.executemany(sql_insert, values)


def generate_data_product():
    sql_insert = "INSERT INTO Product(name, number, price, detail, shop_id) VALUES (%s, %s, %s, %s, %s)"
    values = []
    for _ in range(150):
        name = gen_data.create_nouns(2)
        number = random.randint(10, 200)
        price = random.randint(1000, 10000000)
        detail = gen_data.create_sentence(20, 150)
        shop_id = random.randint(1, 100)
        values.append((name, number, price, detail, shop_id))

    myCursor.executemany(sql_insert, values)


def generate_data_delivery_officer():
    sql_insert = "INSERT INTO DeliveryOfficer(name, phone_number, number_of_assigned_order) VALUES (%s, %s, %s)"
    values = []
    for _ in range(100):
        name = fake.first_name() + fake.last_name()
        phone_number = fake_phone_number()
        number_of_assigned_order = 0
        values.append((name, phone_number, number_of_assigned_order))

    myCursor.executemany(sql_insert, values)


def generate_data_order():
    sql_insert = "INSERT INTO `Order`(total_price, customer_ID) VALUES (%s, %s)"
    values = []
    for _ in range(100):
        total_price = 0
        customer_ID = random.randint(1, 150)
        values.append((total_price, customer_ID))

    myCursor.executemany(sql_insert, values)


def generate_data_order_content():
    sql_insert = "INSERT INTO OrderContent(order_ID, product_ID, number, price) VALUES (%s, %s, %s, %s)"
    values = []
    for _ in range(100):
        order_ID = random.randint(1, 100)
        product_ID = random.randint(1, 150)
        number = random.randint(1, 5)
        sql_get_price = f"SELECT price FROM Product WHERE ID = {product_ID}"
        myCursor.execute(sql_get_price)
        price = myCursor.fetchall()
        price = price[0][0]
        price = number * int(price)
        values.append((order_ID, product_ID, number, price))

    myCursor.executemany(sql_insert, values)


def update_order():
    for order_ID in range(1, 101):
        sql_get_order_content = f"SELECT price FROM OrderContent WHERE order_ID = {order_ID}"
        myCursor.execute(sql_get_order_content)
        price_list = myCursor.fetchall()
        total_price = 0
        print(price_list)
        for price in price_list:
            total_price += int(price[0])
        sql_update_order = f"UPDATE `Order` SET total_price = {total_price} WHERE ID = {order_ID}"
        myCursor.execute(sql_update_order)
        res = myCursor.fetchall()
        print(res)


def generate_data_payment():
    sql_insert = "INSERT INTO Payment(order_ID, customer_ID, delivery_officer_ID, amount) VALUES (%s, %s, %s, %s)"
    values = []
    sql_get_order = "SELECT * FROM `Order`"
    myCursor.execute(sql_get_order)
    order_rows = myCursor.fetchall()
    for order_row in order_rows:
        order_ID = order_row[0]
        amount = order_row[1]
        customer_ID = order_row[2]
        delivery_officer_ID = random.randint(1, 100)
        if int(amount) > 0:
            values.append((order_ID, customer_ID, delivery_officer_ID, amount))

    myCursor.executemany(sql_insert, values)


def update_delivery_officer():
    for delivery_officer_ID in range(1, 101):
        sql_get_payment_delivery_officer_id = f"SELECT COUNT(delivery_officer_ID) FROM Payment Where delivery_officer_ID = {delivery_officer_ID}"
        myCursor.execute(sql_get_payment_delivery_officer_id)
        count = myCursor.fetchall()
        count = count[0][0]
        sql_update_delivery_officer = f"UPDATE DeliveryOfficer SET number_of_assigned_order = {count} WHERE ID = {delivery_officer_ID}"
        myCursor.execute(sql_update_delivery_officer)
        res = myCursor.fetchall()
        print(res)


def generate_data_comment():
    sql_insert = "INSERT INTO Comment(customer_ID, product_ID, score, created_at, content) VALUES (%s, %s, %s, %s, %s)"
    values = []
    sql_get_order = "SELECT * FROM `Order`"
    myCursor.execute(sql_get_order)
    order_rows = myCursor.fetchall()
    for order_row in order_rows:
        order_ID = order_row[0]
        total_price = order_row[1]
        if int(total_price) > 0:
            customer_ID = order_row[2]
            sql_get_order_content = f"SELECT * FROM OrderContent Where order_ID = {order_ID}"
            myCursor.execute(sql_get_order_content)
            order_content_rows = myCursor.fetchall()
            for order_content in order_content_rows:
                product_ID = order_content[1]
                score = random.randint(1, 10)
                created_at = timestamp_generator()
                content = gen_data.create_sentence(20, 100)
                values.append((customer_ID, product_ID, score, created_at, content))

    myCursor.executemany(sql_insert, values)


def update_product():
    for product_ID in range(1, 151):
        sql_get_comment = f"SELECT * FROM Comment WHERE product_ID = {product_ID}"
        myCursor.execute(sql_get_comment)
        comment_rows = myCursor.fetchall()
        number_of_comments = len(comment_rows)
        score = 0
        if number_of_comments > 0:
            for comment in comment_rows:
                score += comment[3]

            avg_score = score / number_of_comments
            sql_update_product = f"UPDATE Product SET score = {avg_score} WHERE ID = {product_ID}"
            myCursor.execute(sql_update_product)
            res = myCursor.fetchall()
            print(res)


update_product()
myDB.commit()
