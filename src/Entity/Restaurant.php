<?php

namespace App\Entity;

use App\Repository\RestaurantRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RestaurantRepository::class)]
class Restaurant
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $created_at = null;

    #[ORM\OneToMany(mappedBy: 'restaurant', targetEntity: Ville::class)]
    private Collection $ville_id;

    public function __construct()
    {
        $this->ville_id = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): static
    {
        $this->created_at = $created_at;

        return $this;
    }

    /**
     * @return Collection<int, Ville>
     */
    public function getVilleId(): Collection
    {
        return $this->ville_id;
    }

    public function addVilleId(Ville $villeId): static
    {
        if (!$this->ville_id->contains($villeId)) {
            $this->ville_id->add($villeId);
            $villeId->setRestaurant($this);
        }

        return $this;
    }

    public function removeVilleId(Ville $villeId): static
    {
        if ($this->ville_id->removeElement($villeId)) {
            // set the owning side to null (unless already changed)
            if ($villeId->getRestaurant() === $this) {
                $villeId->setRestaurant(null);
            }
        }

        return $this;
    }
}
