var amount = 0
var price_all = 0
var i = 0
var tv_list: [tv] = []
class tv {
    private var price = Int()
    private var name: String = ""
    private var name_shop: String = ""
    init(price: Int = 100, name: String, name_shop: String) {
        self.price = price
        self.name = name
        self.name_shop = name_shop
    }
    public func sell() {
        price_all += price
        amount += 1
        print("Продано: \(name) \(name_shop)")
    }
    public func getinfo() -> String {
        return "Телевизор: \(name) Магазин: \(name_shop)"
    }
}
repeat {
    print("Введите номер действия:")
    print("1 - добавить телевизор")
    print("2 - продать телевизор")
    print("3 - вывести выручку и проданое количество")
    print("4 - вывести список телевизоров")
    print("0 - завершить сессию")
    let menu = readLine()
    switch menu {
    case "1":
        print("Введите название телевизора:")
        let name = readLine()
        print("Введите название телевизора:")
        let name_shop = readLine()
        let new_tv = tv(name: name!, name_shop: name_shop!)
        tv_list.append(new_tv)
    case "2":
        if tv_list.isEmpty {
                        print("У вас еще нет телевизоров!")
                    } else {
                        print("Список телевизоров:")
                        for (index, television) in tv_list.enumerated() {
                            print("\(index + 1). \(television.getinfo())")
                        }
                        print("Введите номер телевизора для продажи:")
                        if let input = readLine(), let index = Int(input), index > 0 && index <= tv_list.count {
                            let tvToSell = tv_list[index - 1]
                            tvToSell.sell()
                            tv_list.remove(at: index - 1)
                            print("Телевизор продан!")
                        } else {
                            print("Неверный номер телевизора!")
                        }
                    }
    case "3":
        print("Выручка: \(price_all)")
        print("Продано штук: \(amount)")
    case "4":
        if tv_list.isEmpty {
            print("Нет добавленных телевизоров!")
        } else {
            print("Список телевизоров:")
            for (index, tele) in tv_list.enumerated() {
                print("\(index + 1). \(tele.getinfo())")
            }
        }
    case "0":
        i = 1
        print("До свидания!")
        print("Выручка: \(price_all)")
        print("Продано штук: \(amount)")
    default:
        print("Такой команды нет в меню")
    }
} while i != 1
