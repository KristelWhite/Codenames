//
//  AppDelegate.swift
//  Codenames
//
//  Created by Кристина Пастухова on 28.04.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
//        let mas : String = "ace, Alaska, anchor, ant, anthem, apron, armor, army, ash, astronaut, attic, avalanche, axe, baby, bacon, balloon, banana, barbecue, bass, bath, battle, battleship, bay, beam, bean, beard, bee, beer, bench, bicycle, Big Bang, Big Ben, bikini, biscuit, blacksmith, black hole, blade, blind, blizzard, blues, boil, bonsai, book, boss, bowl, bowler, boxer, brain, brass, Brazil, bread, break, brick, bride, brother, bubble, bucket, bulb, bunk, butter, butterfly, cable, Caesar, cake, camp, cane, captain, castle, cave, chain, chalk, cheese, cherry, chip, Christmas, Cleopatra, clock, cloud, coach, coast, coffee, collar, Columbus, comb, comet, computer, cone, country, cow, cowboy, crab, craft, crow, crusader, crystal, cuckoo, curry, dash, delta, dentist, desk, director, disk, doll, dollar, door, drawing, dream, dressing, driver, drone, drum, dryer, dust, ear, earth, earthquake, easter, Eden, egg, Einstein, elephant, farm, fever, fiddle, flag, flat, flood, floor, foam, fog, frog, frost, fuel, gangster, garden, gear, genie, glacier, glasses, goat, Goldilocks, golf, governor, greenhouse, groom, guitar, gum, gymnast, hair, Halloween, hamburger, hammer, Hawaii, helmet, Hercules, hide, hit, Homer, hose, house, Ice Age, Iceland, igloo, ink, jail, jellyfish, jeweler, Joan of Arc, jockey, joker, judge, jumper, kick, kilt, King Arthur, kiss, kitchen, knot, kung fu, lace, ladder, laundry, leaf, leather, lemonade, letter, lightning, lip, locust, love, lumberjack, lunch, magazine, magician, makeup, manicure, map, maracas, marathon, mark, medic, memory, mess, meter, microwave, mile, milk, mill, minotaur, minute, mirror, miss, mohawk, Mona Lisa, monkey, moses, mosquito, mother, mountie, mud, mummy, musketeer, mustard, napoleon, nerve, newton, noah, nose, Notre Dame, nylon, oasis, onion, pacific, pad, paddle, page, paint, parade, parrot, patient, pea, peach, peanut, pearl, pen, penny, Pentagon, pepper, pew, pig, pillow, pine, pitcher, pizza, pocket, polish, polo, pop, popcorn, potato, potter, powder, puppet, purse, quack, quarter, radio, rail, rainbow, ram, ranch, rat, razor, record, reindeer, rice, rifle, rip, river, road, rodeo, roll, rope, rubber, Russia, rust, sack, saddle, Sahara, sail, salad, saloon, salsa, salt, sand, Santa, saw, scarecrow, scratch, scroll, second, shampoo, shed, sheet, shell, Sherlock, Sherwood, shoot, shorts, shoulder, shower, sign, silk, sister, skates, ski, skull, sled, sleep, sling, slipper, sloth, smell, smoke, smoothie, snake, snap, soap, soup, sphinx, spirit, spoon, spray, spurs, squash, squirrel, St.Patrick, stable, stamp, steam, steel, step, stethoscope, sticker, storm, story, street, sugar, sumo, sun, swamp, sweat, sword, tank, taste, tattoo, tea, team, tear, Texas, thunder, tiger, tin, tip, tipi, toast, tornado, trick, troll, tunnel, turtle, tutu, tuxedo, univerity, valentine, vampire, Venus, viking, violet, virus, volcano, volume, wagon, waitress, walrus, wedding, werewolf, wheel, wheelchair, whistle, window, wing, wish, wizard, Wonderland, wood, wool, Yellowstone, zombie"
//        let spliteArray = mas.components(separatedBy: ", ")
//         //Создание нового объекта
//        let managedObject = Dictionary(context: CoreDataManager.instance.context)
//
//            // Установка значения атрибута
//        managedObject.name = "Original"
//        managedObject.language  = "English"
//        managedObject.type = true
//
//
//        for item in spliteArray {
//            let content = Content(context: CoreDataManager.instance.context)
//            content.word = item
//            content.dictionary = managedObject
//            managedObject.contents?.adding(content)
//
//        }
        //print(managedObject.contents ?? "no content")
        
        

            // Запись объекта
            //CoreDataManager.instance.saveContext()

//            // Извление записей
//            let fetchRequest = NSFetchRequest(entityName: "Customer")
//            do {
//                let results = try CoreDataManager.instance.managedObjectContext.executeFetchRequest(fetchRequest)
//                for result in results as! [Customer] {
//                    print("name - \(result.name!)")
//                }
//            } catch {
//                print(error)
//            }
            return true
        }


}
    
