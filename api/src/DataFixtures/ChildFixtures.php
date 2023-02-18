<?php
declare(strict_types=1);

namespace App\DataFixtures;

use App\Entity\Child;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;

/**
 * Class ChildFixtures
 *
 * @author Daniel Waligora <daniel@blossomeducational.com>
 */
class ChildFixtures extends Fixture implements DependentFixtureInterface
{
    public const CHILDREN = [
        ['name' => 'Bob', 'surname' => 'Dylan', 'archived' => false, 'room' => RoomFixtures::ROOMS[0]['name']],
        ['name' => 'Matt', 'surname' => 'Brown', 'archived' => false, 'room' => RoomFixtures::ROOMS[1]['name']],
        ['name' => 'Joe', 'surname' => 'Zalenski', 'archived' => true, 'room' => RoomFixtures::ROOMS[1]['name']],
        ['name' => 'Rob', 'surname' => 'Smith', 'archived' => false, 'room' => RoomFixtures::ROOMS[1]['name']],
    ];

    public function load(ObjectManager $manager): void
    {
        foreach(self::CHILDREN as $c) {
            $child = new Child();
            $child->setName($c['name']);
            $child->setSurname($c['surname']);
            $child->setArchived($c['archived']);

            $this->addReference($c['name'], $child);

            $child->setRoom($this->getReference($c['room']));

            $manager->persist($child);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return [
            RoomFixtures::class,
        ];
    }
}
