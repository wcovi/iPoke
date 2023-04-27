//
//  PokedexViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class PokedexViewController: UIViewController {

    var pokedexScreen: PokedexScreen?
    var bioCollectionScreen: BioCollectionViewCellScreen?
    
    weak var cellSelectionDelegate: CellSelectionDelegate?
    
    var selectedIndex: Int?
    var selectedType: String?
    var typeFilter: String?
    
    var filteredData: [Pokedex] = []
    
    var dataType: [Types] = [Types(typeLabel: "pokedex", typeButton: "pokedex"),
                             Types(typeLabel: "fire", typeButton: "fireButton"),
                             Types(typeLabel: "water", typeButton: "waterButton"),
                             Types(typeLabel: "grass", typeButton: "grassButton"),
                             Types(typeLabel: "flying", typeButton: "flyingButton"),
                             Types(typeLabel: "fighting", typeButton: "fightingButton"),
                             Types(typeLabel: "poison", typeButton: "poisonButton"),
                             Types(typeLabel: "electric", typeButton: "electricButton"),
                             Types(typeLabel: "ground", typeButton: "groundButton"),
                             Types(typeLabel: "normal", typeButton: "normalButton"),

    ]
    
    var dataPokedex: [Pokedex] = [Pokedex(nameLabel: "Bulbasaur", nameImage: "001", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 0),
                                  Pokedex(nameLabel: "Ivysaur", nameImage: "002", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 1),
                                  Pokedex(nameLabel: "Venusaur", nameImage: "003", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 2),
                                  Pokedex(nameLabel: "Charmander", nameImage: "004", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 3),
                                  Pokedex(nameLabel: "Charmeleon", nameImage: "005", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 4),
                                  Pokedex(nameLabel: "Charizard", nameImage: "006", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "flyingType", originalIndex: 5),
                                  Pokedex(nameLabel: "Squirtle", nameImage: "007", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 6),
                                  Pokedex(nameLabel: "Wartortle", nameImage: "008", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 7),
                                  Pokedex(nameLabel: "Blastoise", nameImage: "009", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 8),
                                  Pokedex(nameLabel: "Carterpie", nameImage: "010", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "", originalIndex: 9),
                                  Pokedex(nameLabel: "Metapod", nameImage: "011", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "", originalIndex: 10),
                                  Pokedex(nameLabel: "Butterfree", nameImage: "012", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "flyingType", originalIndex: 11),
                                  Pokedex(nameLabel: "Weedle", nameImage: "013", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "poisonType", originalIndex: 12),
                                  Pokedex(nameLabel: "Kakuna", nameImage: "014", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "poisonType", originalIndex: 13),
                                  Pokedex(nameLabel: "Beedrill", nameImage: "015", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "poisonType", originalIndex: 14),
                                  Pokedex(nameLabel: "Pidgey", nameImage: "016", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 15),
                                  Pokedex(nameLabel: "Pidgeotto", nameImage: "017", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 16),
                                  Pokedex(nameLabel: "Pidgeot", nameImage: "018", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 17),
                                  Pokedex(nameLabel: "Rattata", nameImage: "019", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 18),
                                  Pokedex(nameLabel: "Raticate", nameImage: "020", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 19),
                                  Pokedex(nameLabel: "Spearow", nameImage: "021", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 20),
                                  Pokedex(nameLabel: "Fearow", nameImage: "022", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 21),
                                  Pokedex(nameLabel: "Ekans", nameImage: "023", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 22),
                                  Pokedex(nameLabel: "Arbok", nameImage: "024", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 23),
                                  Pokedex(nameLabel: "Pikachu", nameImage: "025", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "", originalIndex: 024),
                                  Pokedex(nameLabel: "Raichu", nameImage: "026", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "", originalIndex: 025),
                                  Pokedex(nameLabel: "Sandshrew", nameImage: "027", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "", originalIndex: 26),
                                  Pokedex(nameLabel: "Sandslash", nameImage: "028", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "", originalIndex: 27),
                                  Pokedex(nameLabel: "Nidoran", nameImage: "029", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 28),
                                  Pokedex(nameLabel: "Nidorina", nameImage: "030", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 29),
                                  Pokedex(nameLabel: "Nidoqueen", nameImage: "031", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "groundType", originalIndex: 30),
                                  Pokedex(nameLabel: "Nidoran", nameImage: "032", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 31),
                                  Pokedex(nameLabel: "Nidorino", nameImage: "033", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 32),
                                  Pokedex(nameLabel: "Nidoking", nameImage: "034", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "groundType", originalIndex: 33),
                                  Pokedex(nameLabel: "Clefairy", nameImage: "035", typeLabel: "Fairy", backgroundImage: "fairy", primaryType: "fairyType", secundaryType: "", originalIndex: 34),
                                  Pokedex(nameLabel: "Clefable", nameImage: "036", typeLabel: "Fairy", backgroundImage: "fairy", primaryType: "fairyType", secundaryType: "", originalIndex: 35),
                                  Pokedex(nameLabel: "Vulpix", nameImage: "037", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 36),
                                  Pokedex(nameLabel: "Ninetales", nameImage: "038", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 37),
                                  Pokedex(nameLabel: "Jigglypuff", nameImage: "039", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "fairyType", originalIndex: 38),
                                  Pokedex(nameLabel: "Wigglytuff", nameImage: "040", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "fairyType", originalIndex: 39),
                                  Pokedex(nameLabel: "Zubat", nameImage: "041", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "flyingType", originalIndex: 40),
                                  Pokedex(nameLabel: "Golbat", nameImage: "042", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "flyingType", originalIndex: 41),
                                  Pokedex(nameLabel: "Oddish", nameImage: "043", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 42),
                                  Pokedex(nameLabel: "Gloom", nameImage: "044", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 43),
                                  Pokedex(nameLabel: "Vileplume", nameImage: "045", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 44),
                                  Pokedex(nameLabel: "Paras", nameImage: "046", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "grassType", originalIndex: 45),
                                  Pokedex(nameLabel: "Parasect", nameImage: "047", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "grassType", originalIndex: 46),
                                  Pokedex(nameLabel: "Venonat", nameImage: "048", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "poisonType", originalIndex: 47),
                                  Pokedex(nameLabel: "Venomoth", nameImage: "049", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "poisonType", originalIndex: 48),
                                  Pokedex(nameLabel: "Diglett", nameImage: "050", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "", originalIndex: 49),
                                  Pokedex(nameLabel: "Dugtrio", nameImage: "051", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "", originalIndex: 50),
                                  Pokedex(nameLabel: "Meowth", nameImage: "052", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 51),
                                  Pokedex(nameLabel: "Persian", nameImage: "053", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 52),
                                  Pokedex(nameLabel: "Psyduck", nameImage: "054", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 53),
                                  Pokedex(nameLabel: "Golduck", nameImage: "055", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 54),
                                  Pokedex(nameLabel: "Mankey", nameImage: "056", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 55),
                                  Pokedex(nameLabel: "Primeape", nameImage: "057", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 56),
                                  Pokedex(nameLabel: "Growlithe", nameImage: "058", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 57),
                                  Pokedex(nameLabel: "Arcanine", nameImage: "059", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 58),
                                  Pokedex(nameLabel: "Poliwag", nameImage: "060", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 59),
                                  Pokedex(nameLabel: "Poliwhirl", nameImage: "061", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 60),
                                  Pokedex(nameLabel: "Poliwrath", nameImage: "062", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "fightingType", originalIndex: 61),
                                  Pokedex(nameLabel: "Abra", nameImage: "063", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 62),
                                  Pokedex(nameLabel: "Kadabra", nameImage: "064", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 63),
                                  Pokedex(nameLabel: "Alakazam", nameImage: "065", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 64),
                                  Pokedex(nameLabel: "Machop", nameImage: "066", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 65),
                                  Pokedex(nameLabel: "Machoke", nameImage: "067", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 66),
                                  Pokedex(nameLabel: "Machamp", nameImage: "068", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 67),
                                  Pokedex(nameLabel: "Bellsprout", nameImage: "069", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 68),
                                  Pokedex(nameLabel: "Weepinbell", nameImage: "070", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 69),
                                  Pokedex(nameLabel: "Victreebel", nameImage: "071", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 70),
                                  Pokedex(nameLabel: "Tentacool", nameImage: "072", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "poisonType", originalIndex: 71),
                                  Pokedex(nameLabel: "Tentacruel", nameImage: "073", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "poisonType", originalIndex: 72),
                                  Pokedex(nameLabel: "Geodude", nameImage: "074", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "groundType", originalIndex: 73),
                                  Pokedex(nameLabel: "Graveler", nameImage: "075", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "groundType", originalIndex: 74),
                                  Pokedex(nameLabel: "Golem", nameImage: "076", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "groundType", originalIndex: 75),
                                  Pokedex(nameLabel: "Ponyta", nameImage: "077", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 76),
                                  Pokedex(nameLabel: "Rapidash", nameImage: "078", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 77),
                                  Pokedex(nameLabel: "Slowpoke", nameImage: "079", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "psychicType", originalIndex: 78),
                                  Pokedex(nameLabel: "SlowBro", nameImage: "080", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "psychicType", originalIndex: 79),
                                  Pokedex(nameLabel: "Magnemite", nameImage: "081", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "steelType", originalIndex: 80),
                                  Pokedex(nameLabel: "Magneton", nameImage: "082", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "steelType", originalIndex: 81),
                                  Pokedex(nameLabel: "Farfetch'd", nameImage: "083", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 82),
                                  Pokedex(nameLabel: "Doduo", nameImage: "084", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 83),
                                  Pokedex(nameLabel: "Dodrio", nameImage: "085", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "flyingType", originalIndex: 84),
                                  Pokedex(nameLabel: "Seel", nameImage: "086", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 85),
                                  Pokedex(nameLabel: "Dewgong", nameImage: "087", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "iceType", originalIndex: 86),
                                  Pokedex(nameLabel: "Grimer", nameImage: "088", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 87),
                                  Pokedex(nameLabel: "Muk", nameImage: "089", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 88),
                                  Pokedex(nameLabel: "Shellder", nameImage: "090", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 89),
                                  Pokedex(nameLabel: "Cloyster", nameImage: "091", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "iceType", originalIndex: 90),
                                  Pokedex(nameLabel: "Gastly", nameImage: "092", typeLabel: "Ghost", backgroundImage: "ghost", primaryType: "ghostType", secundaryType: "poisonType", originalIndex: 91),
                                  Pokedex(nameLabel: "Haunter", nameImage: "093", typeLabel: "Ghost", backgroundImage: "ghost", primaryType: "ghostType", secundaryType: "poisonType", originalIndex: 92),
                                  Pokedex(nameLabel: "Gengar", nameImage: "094", typeLabel: "Ghost", backgroundImage: "ghost", primaryType: "ghostType", secundaryType: "poisonType", originalIndex: 93),
                                  Pokedex(nameLabel: "Onix", nameImage: "095", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "groundType", originalIndex: 94),
                                  Pokedex(nameLabel: "Drowzee", nameImage: "096", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 95),
                                  Pokedex(nameLabel: "Hipno", nameImage: "097", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 96),
                                  Pokedex(nameLabel: "Krabby", nameImage: "098", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 97),
                                  Pokedex(nameLabel: "Kingler", nameImage: "099", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 98),
                                  Pokedex(nameLabel: "Voltorb", nameImage: "100", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "", originalIndex: 99),
                                  Pokedex(nameLabel: "Electrode", nameImage: "101", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "", originalIndex: 100),
                                  Pokedex(nameLabel: "Exeggcute", nameImage: "102", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "psychicType", originalIndex: 101),
                                  Pokedex(nameLabel: "Exeggutor", nameImage: "103", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "psychicType", originalIndex: 102),
                                  Pokedex(nameLabel: "Cubone", nameImage: "104", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "", originalIndex: 103),
                                  Pokedex(nameLabel: "Marowak", nameImage: "105", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "", originalIndex: 104),
                                  Pokedex(nameLabel: "Hitmonlee", nameImage: "106", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 105),
                                  Pokedex(nameLabel: "Hitmonchan", nameImage: "107", typeLabel: "Fighting", backgroundImage: "fighting", primaryType: "fightingType", secundaryType: "", originalIndex: 106),
                                  Pokedex(nameLabel: "Lickitung", nameImage: "108", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 107),
                                  Pokedex(nameLabel: "Koffing", nameImage: "109", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 108),
                                  Pokedex(nameLabel: "Weezing", nameImage: "110", typeLabel: "Poison", backgroundImage: "poison", primaryType: "poisonType", secundaryType: "", originalIndex: 109),
                                  Pokedex(nameLabel: "Rhyhorn", nameImage: "111", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "rockType", originalIndex: 110),
                                  Pokedex(nameLabel: "Rhydon", nameImage: "112", typeLabel: "Ground", backgroundImage: "ground", primaryType: "groundType", secundaryType: "rockType", originalIndex: 111),
                                  Pokedex(nameLabel: "Chansey", nameImage: "113", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 112),
                                  Pokedex(nameLabel: "Tangela", nameImage: "114", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "", originalIndex: 113),
                                  Pokedex(nameLabel: "Kangaskhan", nameImage: "115", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 114),
                                  Pokedex(nameLabel: "Horsea", nameImage: "116", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 115),
                                  Pokedex(nameLabel: "Seadra", nameImage: "117", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 116),
                                  Pokedex(nameLabel: "Goldeen", nameImage: "118", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 117),
                                  Pokedex(nameLabel: "Seaking", nameImage: "119", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 118),
                                  Pokedex(nameLabel: "Staryu", nameImage: "120", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 119),
                                  Pokedex(nameLabel: "Starmie", nameImage: "121", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "psychicType", originalIndex: 120),
                                  Pokedex(nameLabel: "Mr. Mime", nameImage: "122", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "fairyType", originalIndex: 121),
                                  Pokedex(nameLabel: "Scyther", nameImage: "123", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "flyingType", originalIndex: 122),
                                  Pokedex(nameLabel: "Jynx", nameImage: "124", typeLabel: "Ice", backgroundImage: "ice", primaryType: "iceType", secundaryType: "psychicType", originalIndex: 123),
                                  Pokedex(nameLabel: "Electrabuzz", nameImage: "125", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "", originalIndex: 124),
                                  Pokedex(nameLabel: "Magmar", nameImage: "126", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex:     25),
                                  Pokedex(nameLabel: "Pinsir", nameImage: "127", typeLabel: "Bug", backgroundImage: "bug", primaryType: "bugType", secundaryType: "", originalIndex: 126),
                                  Pokedex(nameLabel: "Tauros", nameImage: "128", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 127),
                                  Pokedex(nameLabel: "Magikarp", nameImage: "129", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 128),
                                  Pokedex(nameLabel: "Gyarados", nameImage: "130", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "flyingType", originalIndex: 129),
                                  Pokedex(nameLabel: "Lapras", nameImage: "131", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "iceType", originalIndex: 130),
                                  Pokedex(nameLabel: "Ditto", nameImage: "132", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 131),
                                  Pokedex(nameLabel: "Eevee", nameImage: "133", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 132),
                                  Pokedex(nameLabel: "Vaporeon", nameImage: "134", typeLabel: "Water", backgroundImage: "water", primaryType: "waterType", secundaryType: "", originalIndex: 133),
                                  Pokedex(nameLabel: "Jolteon", nameImage: "135", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "", originalIndex: 134),
                                  Pokedex(nameLabel: "Flareon", nameImage: "136", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 135),
                                  Pokedex(nameLabel: "Porygon", nameImage: "137", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 136),
                                  Pokedex(nameLabel: "Omanyte", nameImage: "138", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "waterType", originalIndex: 137),
                                  Pokedex(nameLabel: "Omastar", nameImage: "139", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "waterType", originalIndex: 138),
                                  Pokedex(nameLabel: "Kabuto", nameImage: "140", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "waterType", originalIndex: 139),
                                  Pokedex(nameLabel: "Kabutops", nameImage: "141", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "waterType", originalIndex: 140),
                                  Pokedex(nameLabel: "Aerodactyl", nameImage: "142", typeLabel: "Rock", backgroundImage: "rock", primaryType: "rockType", secundaryType: "flyingType", originalIndex: 141),
                                  Pokedex(nameLabel: "Snorlax", nameImage: "143", typeLabel: "Normal", backgroundImage: "normal", primaryType: "normalType", secundaryType: "", originalIndex: 142),
                                  Pokedex(nameLabel: "Articuno", nameImage: "144", typeLabel: "Ice", backgroundImage: "ice", primaryType: "iceType", secundaryType: "flyingType", originalIndex: 143),
                                  Pokedex(nameLabel: "Zapdos", nameImage: "145", typeLabel: "Electric", backgroundImage: "electric", primaryType: "electricType", secundaryType: "flyingType", originalIndex: 144),
                                  Pokedex(nameLabel: "Moltres", nameImage: "146", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "flyingType", originalIndex: 145),
                                  Pokedex(nameLabel: "Dratini", nameImage: "147", typeLabel: "Dragon", backgroundImage: "dragon", primaryType: "dragonType", secundaryType: "", originalIndex: 146),
                                  Pokedex(nameLabel: "Dragonair", nameImage: "148", typeLabel: "Dragon", backgroundImage: "dragon", primaryType: "dragonType", secundaryType: "", originalIndex: 147),
                                  Pokedex(nameLabel: "Dragonite", nameImage: "149", typeLabel: "Dragon", backgroundImage: "dragon", primaryType: "dragonType", secundaryType: "flyingType", originalIndex: 148),
                                  Pokedex(nameLabel: "Mewtwo", nameImage: "150", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 149),
                                  Pokedex(nameLabel: "Mew", nameImage: "151", typeLabel: "Psychic", backgroundImage: "psychic", primaryType: "psychicType", secundaryType: "", originalIndex: 150),
    ]
    
    override func loadView() {
        pokedexScreen = PokedexScreen()
        view = pokedexScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexScreen?.delegate(delegate: self)
        pokedexScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)
        pokedexScreen?.searchTextField.delegate = self
        filteredData = dataPokedex
    }
}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let typeFilter = typeFilter {
            return filteredData.filter { $0.typeLabel == typeFilter }.count
        } else {
            return filteredData.count
        }
    }
    
    func updateCollectionView() {
        guard let type = selectedType else { return }
        let filterData = dataPokedex.filter { $0.typeLabel == type }
        // atualize sua CollectionView com os dados filtrados
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokedexCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCollectionViewCell.identifier, for: indexPath) as? PokedexCollectionViewCell
        let pokedexData = filteredData[indexPath.row]
            
        cell?.pokedexCollectionViewCellScreen.backgroundImage.image = UIImage(named: pokedexData.backgroundImage)
        cell?.pokedexCollectionViewCellScreen.numberPokeLabel.text = pokedexData.nameImage
        cell?.pokedexCollectionViewCellScreen.nameLabel.text = pokedexData.nameLabel
        cell?.pokedexCollectionViewCellScreen.pokemonImage.image = UIImage(named: pokedexData.nameImage)
        cell?.pokedexCollectionViewCellScreen.typePrimaryImage.image = UIImage(named: pokedexData.primaryType)
        cell?.pokedexCollectionViewCellScreen.typeSecundaryImage.image = UIImage(named: pokedexData.secundaryType)
        
//        if let typeFilter = typeFilter {
//            let filteredData = filteredData.filter { $0.typeLabel == typeFilter }
//            cell?.configure(with: filteredData[indexPath.row])
//        } else {
//            cell?.configure(with: filteredData[indexPath.row])
//        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.315, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = filteredData[indexPath.row]
        let originalIndex = pokemon.originalIndex
        let selectedPokemon = dataPokedex[originalIndex]
        
        cellSelectionDelegate?.didSelectCell(with: selectedPokemon)
        
        let vc = BioViewController()
        vc.data = selectedPokemon
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PokedexViewController: PokedexScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension PokedexViewController: UITextFieldDelegate {

    func filterData() {
        if let searchText = pokedexScreen?.searchTextField.text, !searchText.isEmpty {
            filteredData = dataPokedex.filter { $0.nameLabel.lowercased().contains(searchText.lowercased())
            }
        } else {
            filteredData = dataPokedex
        }
        pokedexScreen?.collectionView.reloadData()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        filterData()
    }
}
