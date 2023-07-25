<?php

namespace App\Form;

use App\Entity\Restaurant;
// use App\Entity\Ville;
use Symfony\Component\Form\AbstractType;
// use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RestaurantType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('description')
            ->add('ville', EntityType::class, [
                'class' => 'App\Entity\Ville',
                'mapped' => false,
                'placeholder' => 'Selectionner la ville'
            ],)
            ->getForm()
            // ->add('created_at')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Restaurant::class,
        ]);
    }
}
