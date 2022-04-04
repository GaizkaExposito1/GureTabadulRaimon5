<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class sponsorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'url' => $this->faker->url(),
            'description' =>  $this->faker->paragraph($nbSentences = 3, $variableNbSentences = true),
            'imgUrl' =>  $this->faker->imageUrl($width = 640, $height = 480),
            'created_at'  => ' 09/12/2000',
        ];
    }
}
