<?php

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Put;
use App\Controller\RoomStatisticController;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ApiResource(
    operations: [
    new Get(
        uriTemplate: '/rooms/statistics',
        controller: RoomStatisticController::class,
        output: false,
        read: false,
        name: 'statistics',

    ),

    new GetCollection(),
    new Get(),
    new Post(),
    new Put(),
    new Delete()
]
)]
#[ORM\Entity]
class Room
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column]
    private ?int $maxCapacity = null;

    #[ORM\OneToMany(mappedBy: 'room', targetEntity: Child::class)]
    private Collection $Child;

    public function __construct()
    {
        $this->Child = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getMaxCapacity(): ?int
    {
        return $this->maxCapacity;
    }

    public function setMaxCapacity(int $maxCapacity): self
    {
        $this->maxCapacity = $maxCapacity;

        return $this;
    }

    /**
     * @return Collection<int, Child>
     */
    public function getChild(): Collection
    {
        return $this->Child;
    }

    public function addChild(Child $child): self
    {
        if (!$this->Child->contains($child)) {
            $this->Child->add($child);
            $child->setRoom($this);
        }

        return $this;
    }

    public function removeChild(Child $child): self
    {
        if ($this->Child->removeElement($child)) {
            // set the owning side to null (unless already changed)
            if ($child->getRoom() === $this) {
                $child->setRoom(null);
            }
        }

        return $this;
    }
}
