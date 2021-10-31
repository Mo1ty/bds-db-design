import random

def name_mixer(m_names, m_sur, fm_names, fm_sur):
    male_names = []
    female_names = []

    for name in m_names:
        for surname in m_sur:
            male_names.append([name,surname])

    for name in fm_names:
        for surname in fm_sur:
            female_names.append([name,surname])

    for list_names in range(0, 60):
        sex = random.randint(0, 1)
        if sex:
            num = random.randint(0, len(male_names))
            chosen = male_names[num]
            print("INSERT INTO car_service.clients VALUES (DEFAULT, '{0}', '{1}');".format(chosen[0], chosen[1]))
            del(male_names[num])
        else:
            num = random.randint(0, len(female_names))
            chosen = female_names[num]
            print("INSERT INTO car_service.clients VALUES (DEFAULT, '{0}', '{1}');".format(chosen[0], chosen[1]))
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

name_mixer(m_names, m_sur, fm_names, fm_sur)
print("")

def carer(brands):

    car_strs = ["AB", "BD", "DS", "VX", "SD", "AS", "JH", "SD", "TR", "WE", "QA"]

    for list_names in range(0, 60):
        brand = brands[random.randint(0, len(brands)-1)]
        model = "A" + str(random.randint(0, 100))
        cars_number = car_strs[random.randint(0, len(car_strs)-1)] + str(random.randint(100, 999)) + car_strs[random.randint(0, len(car_strs)-1)]
        rent_cost = (random.randint(50, 120) // 10) * 10
        print("INSERT INTO car_service.cars VALUES (DEFAULT, '{0}', '{1}', '{2}', {3});".format(brand, model, cars_number, rent_cost))


brands = ["BMW", "Škoda", "Ford", "Chevrolet", "Mazda"]

carer(brands)
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
        print("INSERT INTO car_service.cars_has_car_was_rented VALUES({0}, {1});".format(s, cars_rented))

    print("")
    used_list = []
    for clients_rents in range(1, 51):
        s = random.randint(1, 50)
        while s in used_list:
            s = random.randint(1, 50)
        print("INSERT INTO car_service.clients_has_car_was_rented VALUES({0}, {1});".format(s, clients_rents))

renter()
print("")

def car_has_parking_adder():
    for cars in range(1, 51):
        print("INSERT INTO car_service.cars_has_parking VALUES({0}, {1});".format(cars, random.randint(1,6)))

car_has_parking_adder()
print("")

def client_payment():
    for clients in range(1, 61):
        print("INSERT INTO car_service.clients_has_payment_method VALUES({0}, {1});".format(clients, random.randint(1,5)))

client_payment()
print("")

def client_roles():
    for clients in range(1, 61):
        if clients > 3:
            print("INSERT INTO car_service.clients_has_roles VALUES({0}, {1});".format(clients, random.randint(1,4)))
        else:
            print("INSERT INTO car_service.clients_has_roles VALUES({0}, {1});".format(clients, 5))

client_roles()
print("")
