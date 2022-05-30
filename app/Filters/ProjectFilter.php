<?php

namespace App\Filters;

use EloquentFilter\ModelFilter;

class ProjectFilter extends ModelFilter
{
    /**
     * Related Models that have ModelFilters as well as the method on the ModelFilter
     * As [relationMethod => [input_key1, input_key2]].
     *
     * @var array
     */
    public $relations = [];

    public function search($search): ProjectFilter
    {
        return $this->where('project_title', 'LIKE', '%'.$search.'%');
    }

    public function companies($companies): ProjectFilter
    {
        return $this->whereIn('company_id', $companies);
    }

    public function status($status): ProjectFilter
    {
        return $this->where('status', '=', $status);
    }
}
