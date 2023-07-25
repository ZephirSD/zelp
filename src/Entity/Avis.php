<?php

namespace App\Entity;

use App\Repository\AvisRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AvisRepository::class)]
class Avis
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $message = null;

    #[ORM\Column(nullable: true)]
    private ?float $rating = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $created_at = null;

    #[ORM\ManyToOne(targetEntity: self::class, inversedBy: 'avis_id')]
    private ?self $avis = null;

    #[ORM\OneToMany(mappedBy: 'avis', targetEntity: self::class)]
    private Collection $avis_id;

    #[ORM\ManyToOne(inversedBy: 'avis')]
    private ?Restaurant $restaurant = null;

    public function __construct()
    {
        $this->avis_id = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMessage(): ?string
    {
        return $this->message;
    }

    public function setMessage(?string $message): static
    {
        $this->message = $message;

        return $this;
    }

    public function getRating(): ?float
    {
        return $this->rating;
    }

    public function setRating(?float $rating): static
    {
        $this->rating = $rating;

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

    public function getAvis(): ?self
    {
        return $this->avis;
    }

    public function setAvis(?self $avis): static
    {
        $this->avis = $avis;

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getAvisId(): Collection
    {
        return $this->avis_id;
    }

    public function addAvisId(self $avisId): static
    {
        if (!$this->avis_id->contains($avisId)) {
            $this->avis_id->add($avisId);
            $avisId->setAvis($this);
        }

        return $this;
    }

    public function removeAvisId(self $avisId): static
    {
        if ($this->avis_id->removeElement($avisId)) {
            // set the owning side to null (unless already changed)
            if ($avisId->getAvis() === $this) {
                $avisId->setAvis(null);
            }
        }

        return $this;
    }

    public function getRestaurant(): ?Restaurant
    {
        return $this->restaurant;
    }

    public function setRestaurant(?Restaurant $restaurant): static
    {
        $this->restaurant = $restaurant;

        return $this;
    }
}
