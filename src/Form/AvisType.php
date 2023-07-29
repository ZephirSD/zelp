<?php

namespace App\Form;

use App\Entity\Avis;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class AvisType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('message', TextareaType::class, [
                'attr' => ['rows' => 5],
            ])
            ->add('rating', ChoiceType::class, [
                'placeholder' => 'Selectionner une note',
                'choices' => [
                    '5 étoiles' => '5',
                    '4 étoiles' => '4',
                    '3 étoiles' => '3',
                    '2 étoiles' => '2',
                    '1 étoile' => '1',
                ]
            ],)
            ->getForm();
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Avis::class,
        ]);
    }
}
