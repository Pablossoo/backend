<?php
declare(strict_types=1);

namespace App\DataFixtures;

use App\Entity\Room;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

/**
 * Class RoomFixtures
 *
 * @author Daniel Waligora <daniel@blossomeducational.com>
 */
class RoomFixtures extends Fixture
{
    public const ROOMS = [
        ['name' => 'Apple', 'maxCapacity' => 10],
        ['name' => 'Banana', 'maxCapacity' => 2],
        ['name' => 'Orange', 'maxCapacity' => 2],
    ];

    public function load(ObjectManager $manager): void
    {
        foreach(self::ROOMS as $r) {
            $room = new Room();
            $room->setName($r['name']);
            $room->setMaxCapacity($r['maxCapacity']);

            $this->addReference($r['name'], $room);

            $manager->persist($room);
        }

        $manager->flush();
    }
}
