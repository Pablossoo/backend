<?php

namespace App\Entity;
use ApiPlatform\Metadata\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ApiResource(
//    normalizationContext: ['groups' => ['read']],
//    denormalizationContext: ['groups' => ['write']],
)]
#[ORM\Entity]
class Child
{

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
//    #[Groups(['read', 'write'])]
    private ?int $id = null;

//    #[Groups('write')]
    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    private ?string $surname = null;


    private bool $archived = false;

    #[ORM\ManyToOne(inversedBy: 'Child')]
//    #[Groups('write')]
    private ?Room $room = null;


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

    public function getSurname(): ?string
    {
        return $this->surname;
    }

    public function setSurname(string $surname): self
    {
        $this->surname = $surname;

        return $this;
    }

    public function setArchived(bool $archived): self
    {
        $this->archived = $archived;

        return $this;
    }

    public function isArchived(): bool
    {
        return $this->archived;
    }

    public function getRoom(): ?Room
    {
        return $this->room;
    }

    public function setRoom(?Room $room): self
    {
        $this->room = $room;

        return $this;
    }
}
