<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

class RoomStatisticController extends AbstractController
{
    public function __invoke(): JsonResponse
    {
        return new JsonResponse(['data' => [
            [
                'room' => [
                    'id' => 1
                ],
                'count' => 1
            ],
            [
                'room' => [
                    'id' => 2
                ],
                'count' => 2
            ],
            [
                'room' => [
                    'id' => 3
                ],
                'count' => 0
            ]
        ]],200);
    }
}
