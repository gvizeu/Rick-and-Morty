//
//  MockCharaters.swift
//  Rick and MortyTests
//
//  Created by Gonzalo Vizeu on 17/3/23.
//


#if DEBUG
import Foundation
class MockCharaters {
    static var characters = [
        Character(id: 1, name: "Rick Sanchez", species: "Human", gender: .male, status: .alive),
        Character(id: 2, name: "Morty Smith", species: "Human", gender: .male, status: .alive),
        Character(id: 3, name: "Summer Smith", species: "Human", gender: .female, status: .alive),
        Character(id: 4, name: "Beth Smith", species: "Human", gender: .female, status: .alive),
        Character(id: 5, name: "Abradolf Lincler", species: "Human", gender: .female, status: .unknown),
        Character(id: 6, name: "Ghost in a Jar", species: "Alien", gender: .genderless, status: .dead),
    ]
    
    static var charactersJSON = """
{
    "info": {
        "count": 826,
        "pages": 42,
        "next": "https://rickandmortyapi.com/api/character?page=5",
        "prev": "https://rickandmortyapi.com/api/character?page=3"
    },
    "results": [{
        "id": 61,
        "name": "Campaign Manager Morty",
        "status": "Dead",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/61.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/28"],
        "url": "https://rickandmortyapi.com/api/character/61",
        "created": "2017-11-05T11:53:44.737Z"
    }, {
        "id": 62,
        "name": "Canklanker Thom",
        "status": "Dead",
        "species": "Alien",
        "type": "Gromflomite",
        "gender": "Male",
        "origin": {
            "name": "Gromflom Prime",
            "url": "https://rickandmortyapi.com/api/location/19"
        },
        "location": {
            "name": "unknown",
            "url": ""
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/62.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/1"],
        "url": "https://rickandmortyapi.com/api/character/62",
        "created": "2017-11-05T12:06:23.217Z"
    }, {
        "id": 63,
        "name": "Centaur",
        "status": "Alive",
        "species": "Mythological Creature",
        "type": "Centaur",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Mr. Goldenfold's dream",
            "url": "https://rickandmortyapi.com/api/location/18"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/63.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/2"],
        "url": "https://rickandmortyapi.com/api/character/63",
        "created": "2017-11-05T12:22:17.848Z"
    }, {
        "id": 64,
        "name": "Chris",
        "status": "Dead",
        "species": "Alien",
        "type": "Organic gun",
        "gender": "unknown",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/64.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/12"],
        "url": "https://rickandmortyapi.com/api/character/64",
        "created": "2017-11-05T12:25:03.541Z"
    }, {
        "id": 65,
        "name": "Chris",
        "status": "Alive",
        "species": "Humanoid",
        "type": "Microverse inhabitant",
        "gender": "Male",
        "origin": {
            "name": "Rick's Battery Microverse",
            "url": "https://rickandmortyapi.com/api/location/24"
        },
        "location": {
            "name": "Rick's Battery Microverse",
            "url": "https://rickandmortyapi.com/api/location/24"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/65.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/17"],
        "url": "https://rickandmortyapi.com/api/character/65",
        "created": "2017-11-30T11:02:41.935Z"
    }, {
        "id": 66,
        "name": "Coach Feratu (Balik Alistane)",
        "status": "Dead",
        "species": "Mythological Creature",
        "type": "Vampire",
        "gender": "Male",
        "origin": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
        },
        "location": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/66.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/18"],
        "url": "https://rickandmortyapi.com/api/character/66",
        "created": "2017-11-30T11:10:10.491Z"
    }, {
        "id": 67,
        "name": "Collector",
        "status": "Alive",
        "species": "Alien",
        "type": "Light bulb-Alien",
        "gender": "Male",
        "origin": {
            "name": "The Menagerie",
            "url": "https://rickandmortyapi.com/api/location/25"
        },
        "location": {
            "name": "The Menagerie",
            "url": "https://rickandmortyapi.com/api/location/25"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/67.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/29"],
        "url": "https://rickandmortyapi.com/api/character/67",
        "created": "2017-11-30T11:13:46.785Z"
    }, {
        "id": 68,
        "name": "Colossus",
        "status": "Dead",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "Post-Apocalyptic Earth",
            "url": "https://rickandmortyapi.com/api/location/8"
        },
        "location": {
            "name": "Post-Apocalyptic Earth",
            "url": "https://rickandmortyapi.com/api/location/8"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/68.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/23"],
        "url": "https://rickandmortyapi.com/api/character/68",
        "created": "2017-11-30T11:17:32.733Z"
    }, {
        "id": 69,
        "name": "Commander Rick",
        "status": "Dead",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/69.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/22"],
        "url": "https://rickandmortyapi.com/api/character/69",
        "created": "2017-11-30T11:28:06.461Z"
    }, {
        "id": 70,
        "name": "Concerto",
        "status": "Dead",
        "species": "Humanoid",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "unknown",
            "url": ""
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/70.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/24"],
        "url": "https://rickandmortyapi.com/api/character/70",
        "created": "2017-11-30T11:31:41.926Z"
    }, {
        "id": 71,
        "name": "Conroy",
        "status": "Dead",
        "species": "Robot",
        "type": "",
        "gender": "unknown",
        "origin": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
        },
        "location": {
            "name": "Earth (C-137)",
            "url": "https://rickandmortyapi.com/api/location/1"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/71.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/22"],
        "url": "https://rickandmortyapi.com/api/character/71",
        "created": "2017-11-30T11:35:50.183Z"
    }, {
        "id": 72,
        "name": "Cool Rick",
        "status": "Alive",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "Earth (K-83)",
            "url": "https://rickandmortyapi.com/api/location/26"
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/72.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/28"],
        "url": "https://rickandmortyapi.com/api/character/72",
        "created": "2017-11-30T11:41:11.542Z"
    }, {
        "id": 73,
        "name": "Cop Morty",
        "status": "Dead",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/73.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/28"],
        "url": "https://rickandmortyapi.com/api/character/73",
        "created": "2017-11-30T11:43:04.217Z"
    }, {
        "id": 74,
        "name": "Cop Rick",
        "status": "Alive",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/74.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/28"],
        "url": "https://rickandmortyapi.com/api/character/74",
        "created": "2017-11-30T11:48:18.950Z"
    }, {
        "id": 75,
        "name": "Courier Flap",
        "status": "Alive",
        "species": "Alien",
        "type": "",
        "gender": "unknown",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Planet Squanch",
            "url": "https://rickandmortyapi.com/api/location/35"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/75.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/21"],
        "url": "https://rickandmortyapi.com/api/character/75",
        "created": "2017-11-30T12:12:57.553Z"
    }, {
        "id": 76,
        "name": "Cousin Nicky",
        "status": "Dead",
        "species": "Alien",
        "type": "Parasite",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/76.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/15"],
        "url": "https://rickandmortyapi.com/api/character/76",
        "created": "2017-11-30T14:11:52.882Z"
    }, {
        "id": 77,
        "name": "Cowboy Morty",
        "status": "Alive",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/77.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/10"],
        "url": "https://rickandmortyapi.com/api/character/77",
        "created": "2017-11-30T14:13:17.371Z"
    }, {
        "id": 78,
        "name": "Cowboy Rick",
        "status": "Alive",
        "species": "Human",
        "type": "",
        "gender": "Male",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/78.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/28"],
        "url": "https://rickandmortyapi.com/api/character/78",
        "created": "2017-11-30T14:15:18.347Z"
    }, {
        "id": 79,
        "name": "Crab Spider",
        "status": "Alive",
        "species": "Alien",
        "type": "Animal",
        "gender": "unknown",
        "origin": {
            "name": "Hideout Planet",
            "url": "https://rickandmortyapi.com/api/location/27"
        },
        "location": {
            "name": "Hideout Planet",
            "url": "https://rickandmortyapi.com/api/location/27"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/79.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/10"],
        "url": "https://rickandmortyapi.com/api/character/79",
        "created": "2017-11-30T14:18:16.899Z"
    }, {
        "id": 80,
        "name": "Creepy Little Girl",
        "status": "Alive",
        "species": "Human",
        "type": "",
        "gender": "Female",
        "origin": {
            "name": "unknown",
            "url": ""
        },
        "location": {
            "name": "Mr. Goldenfold's dream",
            "url": "https://rickandmortyapi.com/api/location/18"
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/80.jpeg",
        "episode": ["https://rickandmortyapi.com/api/episode/2"],
        "url": "https://rickandmortyapi.com/api/character/80",
        "created": "2017-11-30T14:20:35.772Z"
    }]
}
"""
}
#endif
