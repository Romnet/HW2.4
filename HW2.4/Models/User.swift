//
//  User.swift
//  HW2.4
//
//  Created by Роман on 08.02.2020.
//  Copyright © 2020 Romnet. All rights reserved.
//

struct User {
    var username: String
    var password: String
    var description: String
}

extension User {
    static func getUsers() -> [User] {
        return [
            User(username: "Roman",
                 password: "pass0",
                 description: "Меня зовут Роман. Мне 27 лет. " +
                    "Сейчас я работаю в закупках, но в будущем " +
                    "хочу разрабатывать приложения для iOS")
        ]
    }
    
    static func getUserBy(username: String) -> User? {
        for user in getUsers() {
            if user.username == username {
                return user
            }
        }
        return nil
    }
}
