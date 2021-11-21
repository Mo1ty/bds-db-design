import random
import unidecode

def clients(m_names, m_sur, fm_names, fm_sur):
    male_names = []
    female_names = []
    phones_used = []
    passes_used = []
    used_nums = []

    for name in m_names:
        for surname in m_sur:
            male_names.append([name, surname])

    for name in fm_names:
        for surname in fm_sur:
            female_names.append([name, surname])

    for list_names in range(0, 50):
        phone = random.randint(100000000, 999999999)
        passport = random.randint(1000000, 9999999)
        while phone in phones_used or passport in passes_used:
            phone = random.randint(100000000, 999999999)
            passport = random.randint(1000000, 9999999)

        phones_used.append(phone)
        passes_used.append(passport)

        sex = random.randint(0, 1)
        if sex:

            num = random.randint(0, len(male_names))
            chosen = male_names[num]

            nums = random.randint(10, 999)
            while nums in used_nums:
                nums = random.randint(10, 999)
            used_nums.append(nums)

            email = unidecode.unidecode(chosen[0].lower()) + str(nums) + "@email.cz"

            print("INSERT INTO car_service.clients VALUES (DEFAULT, '{0}', '{1}', '{2}', '{3}', '{4}');".
                  format(chosen[0], chosen[1], phone, passport, email))
            del(male_names[num])
        else:

            num = random.randint(0, len(female_names))
            chosen = female_names[num]

            nums = random.randint(10, 999)
            while nums in used_nums:
                nums = random.randint(10, 999)
            used_nums.append(nums)

            email = unidecode.unidecode(chosen[0].lower()) + str(nums) + "@email.cz"

            print("INSERT INTO car_service.clients VALUES (DEFAULT, '{0}', '{1}', '{2}', '{3}', '{4}');".
                  format(chosen[0], chosen[1], phone, passport, email))
            del (female_names[num])



m_names = ["Jiří", "Jan", "Petr", "Pavel", "Jaroslav", "Martin",
           "Tomáš", "Miroslav", "František", "Josef", "Václav",
           "Michal", "Karel", "David", "Jakub", "Ladislav",
           "Roman", "Ondřej", "Radek", "Marek"]

m_sur = ["Svoboda", "Novák", "Novotný", "Dvořák", "Černý", "Procházka",
           "Kučera", "Veselý", "Horák", "Němec", "Marek", "Pospíšil",
           "Pokorný", "Hájek", "Král", "Jelínek", "Růžička",
           "Beneš", "Fiala", "Sedláček"]

fm_names = ["Marie", "Jana", "Eva", "Anna", "Hana", "Lenka", "Alena",
            "Jaroslava", "Lucie", "Ludmila", "Jitka", "Jarmila",
            "Veronika", "Martina"]

fm_sur = ["Nováková", "Svobodová", "Novotná", "Dvořáková", "Černá", "Procházková",
          "Kučerová", "Veselá", "Horáková", "Němcová", "Marková", "Pokorná",
          "Pospíšilová", "Hájková", "Králová", "Jelínková", "Růžičková",
          "Benešová", "Fialová", "Sedláčková"]

clients(m_names, m_sur, fm_names, fm_sur)
print("")

cities = ['Brno', 'Praha', 'Dresden', 'Pardubice', 'Ostrava', 'České Budějovice']
streets = ['Rooseveltova', "Nováková", "Drahunova", "Tinková", "Fialová",
           "Horáková", "Němcová", "Hlinky", "Červinková", "Dobrovolná",
           "Svobodná", "Novotná", "Mendlová", "Klusačková", "Jelínková"]

def dealers(cities, streets):
    for i in range(1, 6):
        print("INSERT INTO car_service.dealer_addresses VALUES ({0}, '{1}', '{2}', '{3}', '{4}');".
              format(random.randint(1, 5), cities[random.randint(0, 5)], streets[random.randint(0, 14)], random.randint(1, 150), random.randint(30000, 90000)))

#dealers(cities, streets)

methods = ["Cash", "Card", "Cheque", "Credit_monthly"]

def payment_method(methods):
    for i in range(1, 51):
        year = random.randint(2019, 2021)
        month = random.randint(1, 12)
        day = random.randint(1, 21)
        pay_type = random.randint(0, 3)
        if pay_type == 0:
            print("INSERT INTO car_service.payment_method VALUES (DEFAULT, {0}, {1}, to_date('{2}-{3}-{4}', 'YYYY-MM-DD'), '{5}');".
                format(random.randint(1, 50), random.randint(100, 500)/10, year, month, day, methods[pay_type]))
        else:
            print(
                "INSERT INTO car_service.payment_method VALUES (DEFAULT, {0}, {1}, to_date('{2}-{3}-{4}', 'YYYY-MM-DD'), '{5}', '{6}');".
                format(random.randint(1, 50), random.randint(100, 500) / 10, year, month, day,
                       methods[pay_type], random.randint(30000000, 90000000)))

#payment_method(methods)





def clients_contacts(cities, streets):
    for i in range(1, 51):
        print("INSERT INTO car_service.clients_contacts VALUES ({0}, '{1}', '{2}', '{3}', '{4}');".
              format(i, cities[random.randint(0, 5)], streets[random.randint(0, 14)], random.randint(1, 150), random.randint(30000, 90000)))

#clients_contacts(cities, streets)




def user_login_data():
    for i in range(1, 51):
        login = []
        letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        for j in range(0, 7):
            login.append(random.choice(letters))
        log_in = ''.join(login)
        log_pass = log_in + log_in

        print("INSERT INTO car_service.user_login_data VALUES ({0}, '{1}', '{2}');".
              format(i, log_in, log_pass))

#user_login_data()
#clients_contacts(cities, streets)




def cars_maker(brands):

    car_strs = ["AB", "BD", "DS", "VX", "SD", "AS", "JH", "SD", "TR", "WE", "QA"]

    for list_names in range(0, 60):
        brand = brands[random.randint(0, len(brands)-1)]
        model = "A" + str(random.randint(0, 100))
        cars_number = car_strs[random.randint(0, len(car_strs)-1)] + str(random.randint(100, 999)) + car_strs[random.randint(0, len(car_strs)-1)]
        rent_cost = (random.randint(50, 120) // 10) * 10
        print("INSERT INTO car_service.cars VALUES (DEFAULT, '{0}', {1}, '{2}', '{3}', {4});".format(brand, random.randint(1, 6), model, cars_number, rent_cost))


brands = ["BMW", "Škoda", "Ford", "Chevrolet", "Mazda", "Astra"]

#cars_maker(brands)
print("")

def renter():

    for rents in range(0, 50):
        year = random.randint(2019, 2021)
        month = random.randint(1, 12)
        day_start = random.randint(1, 21)
        day_end = day_start + random.randint(1, 7)
        print("INSERT INTO car_service.car_was_rented VALUES(DEFAULT, (to_date('{0}-{1}-{2}', 'YYYY-MM-DD')), (to_date('{0}-{1}-{3}', 'YYYY-MM-DD')));"
              .format(year, month, day_start, day_end))

    print("")
    used_list = []
    for cars_rented in range(1, 51):
        s = random.randint(1, 50)
        while s in used_list:
            s = random.randint(1, 50)
        print("INSERT INTO car_service.cars_rents VALUES({0}, {1});".format(s, cars_rented))

    print("")
    used_list = []
    for clients_rents in range(1, 51):
        s = random.randint(1, 50)
        while s in used_list:
            s = random.randint(1, 50)
        print("INSERT INTO car_service.clients_rents VALUES({0}, {1});".format(s, clients_rents))

#renter()
print("")

def car_has_parking_adder():
    for cars in range(1, 51):
        print("INSERT INTO car_service.cars_has_parking VALUES({0}, {1});".format(cars, random.randint(1,6)))

#car_has_parking_adder()
print("")

def client_payment():
    for clients in range(1, 61):
        print("INSERT INTO car_service.clients_has_payment_method VALUES({0}, {1});".format(clients, random.randint(1,5)))

# client_payment()
print("")

def client_roles():
    for clients in range(1, 51):
        year = random.randint(2019, 2022)
        month = random.randint(1, 12)
        day = random.randint(1, 28)
        print("INSERT INTO car_service.clients_roles VALUES({0}, {1}, (to_date('{2}-{3}-{4}', 'YYYY-MM-DD')));".format(clients, random.randint(1, 4), year, month, day))

#client_roles()
print("")

def clients_addresses():
    used_nums = []
    for i in range(1, 51):
        s = random.randint(1, 50)
        while s in used_nums:
            s = random.randint(1, 50)
        used_nums.append(s)

        print("INSERT INTO car_service.clients_addresses VALUES({0}, {1});".format(i, s))

#clients_addresses()