<?php

namespace App\Controller;

use App\Entity\Avis;
use App\Form\AvisType;
use Symfony\Bundle\SecurityBundle\Security;
use App\Entity\Restaurant;
use App\Form\RestaurantType;
use App\Repository\AvisRepository;
use App\Repository\RestaurantRepository;
use App\Repository\UserRepository;
use App\Repository\VilleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/restaurant')]
class RestaurantController extends AbstractController
{
    #[Route('/', name: 'app_restaurant_index', methods: ['GET'])]
    public function index(RestaurantRepository $restaurantRepository, UserRepository $userRepository, Request $request): Response
    {
        $user = $userRepository->findUserByEmail($request->getSession()->get(Security::LAST_USERNAME))[0];
        return $this->render('restaurant/index.html.twig', [
            'restaurants' => $restaurantRepository->findRestaurantByIdUser($user->getId()),
        ]);
    }

    #[Route('/new', name: 'app_restaurant_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository): Response
    {
        $restaurant = new Restaurant();
        $form = $this->createForm(RestaurantType::class, $restaurant);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $restaurant->setUser($userRepository->findUserByEmail($request->getSession()->get(Security::LAST_USERNAME))[0]);
            $restaurant->setVille($form->get('ville')->getData());
            $entityManager->persist($restaurant);
            $entityManager->flush();
            return $this->redirectToRoute('app_restaurant_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('restaurant/new.html.twig', [
            'restaurant' => $restaurant,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_restaurant_show', methods: ['GET', 'POST'])]
    public function show(Request $request, Restaurant $restaurant, VilleRepository $villeRepository, RestaurantRepository $restaurantRepository, AvisRepository $avisRepository, EntityManagerInterface $entityManager): Response
    {
        $avis = new Avis();
        $formAvis = $this->createForm(AvisType::class, $avis);
        $formAvis->handleRequest($request);

        if ($formAvis->isSubmitted() && $formAvis->isValid()) {
            $avis->setRestaurant($restaurantRepository->findRestaurantById($restaurant->getId())[0]);
            $entityManager->persist($avis);
            $entityManager->flush();
            return $this->redirectToRoute('app_restaurant_show', ['id' => $restaurant->getId()], Response::HTTP_SEE_OTHER);
        }
        return $this->render('restaurant/show.html.twig', [
            'restaurant' => $restaurant,
            'ville' => $villeRepository->findNameVille($restaurant->getVille()),
            'formAvis' => $formAvis,
            'avis' => $avisRepository->findAllRestaurantById($restaurant->getId()),
        ]);
    }

    #[Route('/{id}/edit', name: 'app_restaurant_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Restaurant $restaurant, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(RestaurantType::class, $restaurant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_restaurant_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('restaurant/edit.html.twig', [
            'restaurant' => $restaurant,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_restaurant_delete', methods: ['POST'])]
    public function delete(Request $request, Restaurant $restaurant, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$restaurant->getId(), $request->request->get('_token'))) {
            $entityManager->remove($restaurant);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_restaurant_index', [], Response::HTTP_SEE_OTHER);
    }
}
