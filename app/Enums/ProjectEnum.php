<?php

namespace App\Enums;


class ProjectEnum
{

    public function statuses()
    {
        $statusList = [
            ['id' => 1, 'name' => 'Pending'],
            ['id' => 2, 'name' => 'In-Progress'],
            ['id' => 3, 'name' => 'Completed'],
            ['id' => 4, 'name' => 'Review']
        ];
        return $statusList;
    }
}
