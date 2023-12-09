<?php

namespace Database\Factories;

use App\Models\Content\Post;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */

    public function definition()
    {
        return [
            'title' => $this->faker->unique()->sentence,
            'summary'=>$this->faker->text,
            'body'=>$this->faker->text,
          



            
        ];
    }
}
